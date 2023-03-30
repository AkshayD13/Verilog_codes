module fsm_111010_case(input x,clk,rst,output reg y);
reg [2:0]p_state,n_state;
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
parameter s5=3'b101;
always @(posedge clk)
begin
	if(rst)
	begin
		{p_state,n_state}<=0;
	end
	else
	begin
		p_state<=n_state;
	end
end
always @(p_state,x)
begin
	y=0;
	case(p_state)
	s0:
	if(x==0)
	begin
		n_state=s0;
	end
	else
	begin
		n_state=s1;
	end
	s1:
	if(x==0)
	begin
		n_state=s0;
	end
	else
	begin
		n_state=s2;
	end
	s2:
	if(x==0)
	begin
		n_state=s0;
	end
	else
	begin
		n_state=s3;
	end
	s3:
	if(x==0)
	begin
		n_state=s4;
	end
	else
	begin
		n_state=s3;
	end
	s4:
	if(x==0)
	begin
		n_state=s0;
	end
	else
	begin
		n_state=s5;
	end
	s5:
	if(x==0)
	begin
		n_state=s0;
		y<=1;
	end
	else
	begin
		n_state=s2;
	end
	endcase
end
endmodule

