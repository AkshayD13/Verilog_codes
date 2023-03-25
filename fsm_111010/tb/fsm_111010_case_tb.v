module fsm_111010_case_tb;
reg x,clk,rst;
wire y;
reg [5:0] array;
fsm_111010_case dut(.x(x),.clk(clk),.rst(rst),.y(y));
initial
begin
	clk=0;
	rst=1;
	x=0;
	array=0;
	#5 rst=0;
	repeat(80)
	begin
		#30 x=$urandom % 2;
	end
	$stop;
end
always
begin
	#10 clk=~clk;
	array=array<<1;
	array[0]=x;
	if(array==6'b111010)
	begin
		if(y!=1)
		begin
			$display($time,"Error observed. The expected value is %b, the observed value is %b",1, y);
		end
	end
	$display($time,"x=%b,rst=%b,y=%b,array=%b",x,rst,y,array);
end
endmodule

	
		