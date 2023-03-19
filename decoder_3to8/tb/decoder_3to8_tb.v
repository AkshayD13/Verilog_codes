module decoder_3to8_tb;
reg [2:0]d;
reg enable;
wire [7:0]y_test;
decoder_3to8 dut(.d(d),.enable(enable),.y(y_test));
initial
begin
	repeat(50)
	begin
		enable=1;
		#5 d=$random;
		
	end
end
initial
begin
	repeat(10)
	begin
		enable=0;
		#5 d=$random;
		
	end
end
initial
begin
	$monitor($time,"d=%b,enable=%b,y_test=%b",d,enable,y_test);
end
endmodule