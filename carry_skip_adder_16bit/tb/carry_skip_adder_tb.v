module carry_skip_adder_16bit_tb;
reg [15:0]a,b;
reg cin;
wire [15:0]s;
wire cout;
reg [15:0]sum_expected;
reg cout_expected;
carry_skip_adder_16bit dut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
initial
begin
	repeat(80)
	begin	
		#5 a=$random % 65535;
		b=$random % 65535;
		cin= $random %1;
		#5 {cout_expected,sum_expected}=a+b+cin;
		$display($time,"a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,cout);
		if(sum_expected!=s || cout_expected!=cout)
			$display($time,"Error observed. Expected value: %b %b. Actual value: %b %b",sum_expected,cout_expected,s,cout);
	end
end
endmodule