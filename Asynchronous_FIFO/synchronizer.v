`timescale 1ns/1ps

module syncr #(parameter N=4)(
    input clk,rst,
    input [N-1:0]Din,
    output reg [N-1:0]Q
);

reg [N-1:0]tmp;

always @(posedge clk) begin
if(rst) begin
tmp<=0;
Q<=0;
end
else begin
tmp<=Din;
Q<=tmp;
end
end

endmodule