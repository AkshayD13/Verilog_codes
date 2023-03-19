module mux_4to1_case(input [3:0]d,input [1:0]select, output reg y);
always @(select,d)
begin
	case(select)
	2'b00:y=d[0];
	2'b01:y=d[1];
	2'b10:y=d[2];
	2'b11:y=d[3];
	endcase
end
endmodule

module mux_4to1_if(input [3:0]d,input [1:0]select, output reg y);
always @(select,d)
begin	
	if(select==2'b00)
		y=d[0];
	else if(select==2'b01)
		y=d[1];
	else if(select==2'b10)
		y=d[2];
	else 
		y=d[3];
end
endmodule

module mux_4to1_ternary(input [3:0]d, input [1:0]select, output y);
assign y=select[1]?(select[0]?d[3]:d[2]):(select[0]?d[1]:d[0]);
endmodule

	