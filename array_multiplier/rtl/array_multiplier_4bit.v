module full_adder(input a,b,cin,output sum,cout);
assign sum=a^b^cin;
assign cout = a&b|a&cin|b&cin;
endmodule

module array_multiplier_structural(input [3:0]a,b,output [7:0]s);
wire [10:0]c;
wire [3:0]p0,p1,p2,p3;
wire [5:0]is;
and a0(p0[0],a[0],b[0]);
assign s[0] = p0[0];
and a1(p1[0],a[1],b[0]);
and a2(p2[0],a[2],b[0]);
and a3(p3[0],a[3],b[0]);
and a4(p0[1],a[0],b[1]);
and a5(p1[1],a[1],b[1]);
and a6(p2[1],a[2],b[1]);
and a7(p3[1],a[3],b[1]);
and a8(p0[2],a[0],b[2]);
and a9(p1[2],a[1],b[2]);
and a10(p2[2],a[2],b[2]);
and a11(p3[2],a[3],b[2]);
and a12(p0[3],a[0],b[3]);
and a13(p1[3],a[1],b[3]);
and a14(p2[3],a[2],b[3]);
and a15(p3[3],a[3],b[3]);

full_adder FA1(p1[0],p0[1],1'b0,s[1],c[0]);
full_adder FA2(p1[1],p2[0],1'b0,is[0],c[1]);
full_adder FA3(p2[1],p3[0],1'b0,is[1],c[2]);
full_adder FA4(is[0],c[0],p0[2],s[2],c[3]);
full_adder FA5(is[1],c[1],p1[2],is[2],c[4]);
full_adder FA6(p3[1],c[2],p2[2],is[3],c[5]);
full_adder FA7(is[2],c[3],p0[3],s[3],c[6]);
full_adder FA8(is[3],c[4],p1[3],is[4],c[7]);
full_adder FA9(p3[2],c[5],p2[3],is[5],c[8]);
full_adder FA10(is[4],c[6],1'b0,s[4],c[9]);
full_adder FA11(is[5],c[7],c[9],s[5],c[10]);
full_adder FA12(p3[3],c[8],c[10],s[6],s[7]);

endmodule

module array_multiplier_dataflow(input [3:0]a,b,output [7:0]s);
reg [3:0]p0,p1,p2,p3;
reg [5:0]is;
reg [11:0]c;
assign p0[0]=a[0]&b[0];
assign p0[1]=a[0]&b[1];
assign p0[2]=a[0]&b[2];
assign p0[3]=a[0]&b[3];
assign p1[0]=a[1]&b[0];
assign p1[1]=a[1]&b[1];
assign p1[2]=a[1]&b[2];
assign p1[3]=a[1]&b[3];
assign p2[0]=a[2]&b[0];
assign p2[1]=a[2]&b[1];
assign p2[2]=a[2]&b[2];
assign p2[3]=a[2]&b[3];
assign p3[0]=a[3]&b[0];
assign p3[1]=a[3]&b[1];
assign p3[2]=a[3]&b[2];
assign p3[3]=a[3]&b[3];
assign is[0]=p1[1]^p2[0]^1'b0;
assign is[1]=p2[1]^p3[0]^1'b0;
assign is[2]=p1[2]^is[1]^c[1];
assign is[3]=p3[1]^p2[2]^c[2];
assign is[4]=p1[3]^is[3]^c[4];
assign is[5]=p3[2]^p2[3]^c[5];
assign c[0]=p0[1]&p1[0]|p0[1]&1'b0|p1[0]&1'b0;
assign c[1]=p1[1]&p2[0]|p1[1]&1'b0|p2[0]&1'b0;
assign c[2]=p2[1]&p3[0]|p2[1]&1'b0|p3[0]&1'b0;
assign c[3]=is[0]&c[0]|is[0]&p0[2]|c[0]&p0[2];
assign c[4]=is[1]&c[1]|is[1]&p1[2]|c[1]&p1[2];
assign c[5]=p3[1]&c[2]|p3[1]&p2[2]|c[2]&p2[2];
assign c[6]=is[2]&c[3]|is[2]&p0[3]|c[3]&p0[3];
assign c[7]=is[3]&c[4]|is[3]&p1[3]|c[4]&p1[3];
assign c[8]=p3[2]&c[5]|p3[2]&p2[3]|c[5]&p2[3];
assign c[9]=is[4]&c[6]|is[4]&1'b0|c[6]&1'b0;
assign c[10]=is[5]&c[7]|is[5]&c[9]|c[7]&c[9];
assign c[11]=p3[3]&c[8]|p3[3]&c[10]|c[8]&c[10];
assign s[0]=p0[0];
assign s[1]=p0[1]^p1[0]^1'b0;
assign s[2]=is[0]^c[0]^p0[2];
assign s[3]=is[2]^c[3]^p0[3];
assign s[4]=is[4]^c[6]^1'b0;
assign s[5]=is[5]^c[7]^c[9];
assign s[6]=p3[3]^c[8]^c[10];
assign s[7]=c[11];
endmodule



