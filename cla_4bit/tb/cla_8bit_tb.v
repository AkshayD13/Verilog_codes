module cla_8bit_tb;
reg [7:0]a,b;
reg cin;
wire [7:0]s;
wire cout;
reg test_complete,error_flag;
reg [7:0]sum_expected;
reg cout_expected;
cla_8bit dut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
initial
begin
	repeat(400)
	begin
	#10 a=$random;
	b=$random;
	cin=$random;
	end
	test_complete=1;
end
always @(s,cout)
begin
	error_flag=0;
	#5 {cout_expected,sum_expected}=a+b+cin;
	$display($time,"a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,cout);
	if(sum_expected!=s || cout_expected!=cout)
	begin
	$display($time,"Error observed. Expected output: %b %b, Actual output: %b %b",sum_expected,cout_expected,s,cout);
		error_flag=1;
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
