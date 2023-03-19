module binary_to_gray_converter_8bit(input [7:0]d,output [7:0]y);
assign y[7]=d[7];
assign y[6]=d[7]^d[6];
assign y[5]=d[6]^d[5];
assign y[4]=d[5]^d[4];
assign y[3]=d[4]^d[3];
assign y[2]=d[3]^d[2];
assign y[1]=d[2]^d[1];
assign y[0]=d[1]^d[0];
endmodule