`timescale 1ns/1ps

module rd_ptr_hndlr #(parameter N=4)(
    input r_clk,r_rst,r_en,
    input [N:0]g_wr_ptr_sync,
    output reg [N:0]b_rd_ptr,g_rd_ptr,
    output reg empty 
);

wire [N-1:0]b_rd_ptr_next;
wire [N-1:0]g_rd_ptr_next;
wire wempty;

assign b_rd_ptr_next = b_rd_ptr + (r_en && !empty);
assign g_rd_ptr_next = b_rd_ptr_next ^ (b_rd_ptr_next >> 1);

always @(posedge r_clk) begin
if(r_rst) begin
b_rd_ptr<=0;
g_rd_ptr<=0;
end
else begin
b_rd_ptr<=b_rd_ptr_next;
g_rd_ptr<=g_rd_ptr_next;
end
end

always @(posedge r_clk) begin 
if(r_rst) empty<=0;
else empty<=wempty;
end

assign wempty = (g_rd_ptr_next == g_wr_ptr_sync);

endmodule