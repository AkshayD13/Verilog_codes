module multiplier_tb;
reg [3:0]a,b;
wire [7:0]s1,s2;
reg [7:0]result_expected;
integer i,j;
array_multiplier_structural dut1(.a(a),.b(b),.s(s1));
array_multiplier_dataflow dut2(.a(a),.b(b),.s(s2));
initial
begin 
for(i=0;i<16;i=i+1)
	begin
	for(j=0;j<16;j=j+1)
		begin
		#20	a=i;
			b=j;
		#5	$display($time,"a = %b,b = %b,s1 = %b,s2=%b",a,b,s1,s2);
			result_expected=a*b;
		#10 if(result_expected!=s1 || result_expected!= s2)
			begin
				$display($time,"Error observed. Expected output: %b , actual output of module 1 and module 2: %b %b",result_expected,s1,s2);
			end
		end
	end
end
endmodule
