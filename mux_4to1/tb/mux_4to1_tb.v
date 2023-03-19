module mux_4to1_tb;
reg [3:0]d;
reg [1:0]select;
wire y_test;
mux_4to1_case dut1(.d(d),.select(select),.y(y_test));
initial
begin
	repeat(100)
	begin
		d=$random % 16;
		select= $random % 16;
		#10
		$display($time,"d=%b,select=%b,y=%b",d,select,y_test);
		if(select==2'b00)
		begin
			if(y_test!=d[0])
				$display("Error!! expected: y=%b, actual: %b",y_test,d[0]);
		end
		if(select==2'b01)
		begin
			if(y_test!=d[1])
				$display("Error!! expected: y=%b, actual: %b",y_test,d[1]);
		end
		if(select==2'b10)
		begin
			if(y_test!=d[2])
				$display("Error!! expected: y=%b, actual: %b",y_test,d[2]);
		end
		if(select==2'b11)
		begin
			if(y_test!=d[3])
				$display("Error!! expected: y=%b, actual: %b",y_test,d[3]);
		end
	end
end
endmodule
	