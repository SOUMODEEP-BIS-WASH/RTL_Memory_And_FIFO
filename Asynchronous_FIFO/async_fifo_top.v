`timescale 1ns/1ps

module async_fifo_top #(parameter N=4,D=16)(
input w_clk,r_clk,
input w_en,r_en,
input w_rst,r_rst,
input [7:0]Din,
output [7:0]Dout,
output full,empty
);

wire [N:0] b_r_ptr, b_w_ptr;
wire [N:0] g_r_ptr, g_w_ptr;
wire [N:0] g_r_ptr_sync, g_w_ptr_sync;

syncr #(N) w_sync(r_clk,r_rst,g_w_ptr,g_w_ptr_sync);
syncr #(N) r_sync(w_clk,w_rst,g_r_ptr,g_r_ptr_sync);

wr_ptr_hndlr #(N) w_ptr_h(w_clk,w_rst,w_en,g_r_ptr_sync,b_w_ptr,g_w_ptr,full);
rd_ptr_hndlr #(N) r_ptr_h(r_clk,r_rst,r_en,g_w_ptr_sync,b_r_ptr,g_r_ptr,empty);

fifo_mem #(N,D) fifo_memory (w_clk,w_en,w_rst,b_w_ptr,b_r_ptr,Din,full,Dout);

endmodule