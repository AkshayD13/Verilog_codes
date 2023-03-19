module full_adder(input a,b,cin,output s,c);
assign s=a^b^cin;
assign c=a&b|b&cin|a&cin;
endmodule

module rca_4bit(input [3:0]a,b,input cin,output [3:0]s,output cout);
wire [2:0]c;
full_adder fa1(a[0],b[0],cin,s[0],c[0]);
full_adder fa2(a[1],b[1],c[0],s[1],c[1]);
full_adder fa3(a[2],b[2],c[1],s[2],c[2]);
full_adder fa4(a[3],b[3],c[2],s[3],cout);
endmodule

