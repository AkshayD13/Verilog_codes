module binary_to_gray_converter_8bit_tb;
reg [7:0]d;
wire [7:0]y;
integer i;
binary_to_gray_converter_8bit dut(.d(d),.y(y));
initial
begin
	repeat(80)
	begin	
		#5 d=$random % 256;
		#5 $display($time,"d=%b,y=%b",d,y);
	end
end
endmodule