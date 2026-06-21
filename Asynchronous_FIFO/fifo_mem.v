`timescale 1ns/1ps

module fifo_mem #(parameter N=4,D=16)(
input w_clk,w_en,w_rst,
input [N:0]w_ptr,r_ptr,
input [7:0]Din,
input full,
output [7:0]Dout
);

reg [7:0]mem[D-1:0];
integer i;

always @(posedge w_clk or posedge w_rst) begin 
if(w_rst) begin
for(i=0;i<D;i=i+1) mem[i]<=0;
end
else begin
 if(w_en && !full) mem[w_ptr[N-1:0]] <= Din;
end
end

assign Dout = mem[r_ptr[N-1:0]];

endmodule