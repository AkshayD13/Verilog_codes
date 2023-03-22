module mod_13_updown_counter_tb;
reg x,clk,rst;
wire [3:0]count;
mod_13_updown_counter dut(.x(x),.clk(clk),.rst(rst),.count(count));
always #5 clk=~clk;
initial
begin
	clk=0;
	rst=1;
	x=0;
	repeat(2) @(posedge clk)
	begin
		rst=0;
		$display($time,"x=%b,rst=%b,count=%b",x,rst,count);
	end
	repeat(15) @(posedge clk)
	begin
		$display($time,"x=%b,rst=%b,count=%b",x,rst,count);
	end
	x=1;
	repeat(15) @(posedge clk)
	begin
		$monitor($time,"x=%b,rst=%b,count=%b",x,rst,count);
	end
	$stop;
end
endmodule