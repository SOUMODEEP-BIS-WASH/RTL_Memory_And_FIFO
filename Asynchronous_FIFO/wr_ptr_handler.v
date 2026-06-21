`timescale 1ns/1ps

module wr_ptr_hndlr #(parameter N=4)(
    input w_clk,w_rst,w_en,
    input [N:0]g_rd_ptr_sync,
    output reg [N:0]b_wr_ptr,g_wr_ptr,
    output reg full 
);

wire [N-1:0]b_wr_ptr_next;
wire [N-1:0]g_wr_ptr_next;
wire wfull;

assign b_wr_ptr_next = b_wr_ptr + (w_en && !full);
assign g_wr_ptr_next = b_wr_ptr_next ^ (b_wr_ptr_next >> 1);

always @(posedge w_clk) begin
if(w_rst) begin
b_wr_ptr<=0;
g_wr_ptr<=0;
end
else begin
b_wr_ptr<=b_wr_ptr_next;
g_wr_ptr<=g_wr_ptr_next;
end
end

always @(posedge w_clk) begin 
if(w_rst) full<=0;
else full<=wfull;
end

assign wfull = (g_wr_ptr_next == {~g_rd_ptr_sync[N:N-1],g_rd_ptr_sync[N-2:0]});

endmodule