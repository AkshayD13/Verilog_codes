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

module carry_skip_adder_16bit(input [15:0]a,b,input cin,output [15:0]s,output cout);
wire [15:0]p;
wire [3:0]c;
wire cout1,cout2,cout3;
assign p[0]=a[0]^b[0];
assign p[1]=a[1]^b[1];
assign p[2]=a[2]^b[2];
assign p[3]=a[3]^b[3];
assign p[4]=a[4]^b[4];
assign p[5]=a[5]^b[5];
assign p[6]=a[6]^b[6];
assign p[7]=a[7]^b[7];
assign p[8]=a[8]^b[8];
assign p[9]=a[9]^b[9];
assign p[10]=a[10]^b[10];
assign p[11]=a[11]^b[11];
assign p[12]=a[12]^b[12];
assign p[13]=a[13]^b[13];
assign p[14]=a[14]^b[14];
assign p[15]=a[15]^b[15];
rca_4bit rca1(a[3:0],b[3:0],cin,s[3:0],c[0]);
assign cout1=(p[3]&p[2]&p[1]&p[0])?cin:c[0];
rca_4bit rca2(a[7:4],b[7:4],cout1,s[7:4],c[1]);
assign cout2=(p[7]&p[6]&p[5]&p[4])?cout1:c[1];
rca_4bit rca3(a[11:8],b[11:8],cout2,s[11:8],c[2]);
assign cout3=(p[11]&p[10]&p[9]&p[8])?cout2:c[2];
rca_4bit rca4(a[15:12],b[15:12],cout3,s[15:12],c[3]);
assign cout=(p[15]&p[14]&p[13]&p[12])?cout3:c[3];
endmodule
