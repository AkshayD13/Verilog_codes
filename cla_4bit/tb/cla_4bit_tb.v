module cla_4bit_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire cout;
reg [3:0]sum_expected;
reg cout_expected;
cla_4bit dut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
initial
begin
	repeat(80)
	begin
	#5 a=$random % 16;
	b=$random % 16;
	cin=$random % 2;
	#5 {cout_expected,sum_expected}=a+b+cin;
	$display($time,"a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,cout);
		if(sum_expected!=s || cout_expected!=cout)
			$display($time,"Error observed. Expected output: %b %b, Actual output: %b %b",sum_expected,cout_expected,s,cout);
	end
end
endmodule