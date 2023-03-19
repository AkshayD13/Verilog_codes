module dual_port_sync_ram(data_in,data_out,address_read,address_write,clk,rst,read_enable,write_enable);
parameter ram_width=8;
parameter ram_locations=1024;
parameter ram_address=10;
input [ram_width-1:0]data_in;
input clk,rst,read_enable,write_enable;
input [ram_address-1:0]address_read,address_write;
output reg [ram_width-1:0]data_out;
reg [ram_width-1:0]memory[ram_locations-1:0];
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
	else
	begin	
		if(write_enable)
		begin
			memory[address_write]<=data_in;
		end
		if(read_enable)
		begin
			data_out<=memory[address_read];
		end
	end
end
endmodule