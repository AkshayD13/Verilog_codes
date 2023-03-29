module mux_4to1_tb;
reg [3:0]d;
reg [1:0]select;
wire y_test;
reg test_complete, error_flag;
mux_4to1_case dut1(.d(d),.select(select),.y(y_test));
initial
begin
	repeat(100)
	begin
		#10 d=$random % 16;
		select= $random % 16;
	end
	test_complete=1;
end
always @(y_test)
begin
	error_flag=0;
	#5 $display($time,"d=%b,select=%b,y_test=%b",d,select,y_test);
	if(select==2'b00)
	begin
		if(y_test!=d[0])
		begin
			$display("Error!! expected: y=%b, actual: y_test= %b",d[0], y_test);
			error_flag=1;
		end
	end
	if(select==2'b01)
	begin
		if(y_test!=d[1])
		begin
			$display("Error!! expected: y=%b, actual: y_test= %b",d[1], y_test);
			error_flag=1;
		end
	end
	if(select==2'b10)
	begin
		if(y_test!=d[2])
		begin
			$display("Error!! expected: y=%b, actual: y_test= %b",d[2], y_test);
			error_flag=1;
		end
	end
	if(select==2'b11)
	begin
		if(y_test!=d[3])
		begin
			$display("Error!! expected: y=%b, actual: y_test= %b",d[3], y_test);
			error_flag=1;
		end
	end
end
always @(test_complete)
begin
	if(error_flag)
		$display("Tests failed");
	else
		$display("Tests passed");
end 
endmodule
	
