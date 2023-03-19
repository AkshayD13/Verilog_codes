module single_port_ram(data,addr,clk,rst,wr,rd,cs,data_out);
parameter ram_width=8;
parameter ram_locations=10;
parameter ram_address_size=1024;
reg [ram_width-1:0]memory[ram_address_size-1:0];
input [ram_width-1:0]data;
input [ram_locations-1:0]addr;
output reg[ram_width-1:0]data_out;
input clk,rst,rd,wr,cs;
integer i;
always @(posedge clk)
begin
	if(rst)
	begin
		for(i=0;i<1024;i=i+1)
		begin
			memory[i]<=0;
		end
	end
	else if(cs&&wr&&!rd)
	begin
		memory[addr]<=data;
	end
	else if(cs&&rd&&!wr)
	begin
		data_out<=memory[addr];
	end
end
assign data=(rd&&cs)?data_out:8'bz;
endmodule