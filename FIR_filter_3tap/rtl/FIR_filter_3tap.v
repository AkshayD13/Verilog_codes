module FIR_filter_3tap(input [3:0] in,c1,c2,c3, input clk, output [8:0]y);
reg [3:0] r1,r2,r3;
wire [7:0] w1,w2,w3;
wire [8:0] w4;
always @(posedge clk)
begin
	r1<=in;
	r2<=r1;
	r3<=r2;
end
assign w1=r1*c1;
assign w2=r2*c2;
assign w3=r3*c3;
assign w4=w1+w2;
assign y=w3+w4;
endmodule

