module encoder_8to3_tb;
reg [7:0]d;
reg enable;
wire [2:0]y_test;
encoder_8to3 dut(.d(d),.enable(enable),.y(y_test));
initial
begin
	enable=1;
	#5 d=8'b00001000;
	#5 d=8'b10000000;
	#5 d=8'b01000000;
	#5 d=8'b00001000;
	#5 d=8'b00010000;
	#5 d=8'b00000001;
	#5 d=8'b00000010;
	#5 d=8'b00100000;
	#5 d=8'b01001000;
	enable=0;
	#5 d=8'b00000001;
	#5 d=8'b00000010;
	#5 d=8'b00100000;
	#5 d=8'b01001000;
end
initial
begin
	$monitor($time,"d=%b,enable=%b,y_test=%b",d,enable,y_test);
end
endmodule
	
	