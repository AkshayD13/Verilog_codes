module mod_13_updown_counter(input x,clk,rst,output reg [3:0] count);
always @(posedge clk)
begin
	if(rst)
	begin	
		count<=0;
	end
	else
	begin
		if(x==0)
		begin
			count<=count+1;
			if(count==12)
				count<=0;
		end
		else if(x==1)
		begin
			count<=count-1;
			if(count==0)
				count<=12;
		end
	end
end
endmodule