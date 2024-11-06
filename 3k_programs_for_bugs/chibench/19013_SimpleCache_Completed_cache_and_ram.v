// This program was cloned from: https://github.com/psnjk/SimpleCache
// License: MIT License

module cache_and_ram(
	input [31:0] address,
	input [31:0] data,
	input clk,
	input mode,	//mode equal to 1 when we write and equal to 0 when we read
	output [31:0] out
);

//previous values
reg [31:0] prev_address, prev_data;
reg prev_mode;
reg [31:0] temp_out;

reg [cache.index_size - 1:0] index;	// for keeping index of current address
reg [11 - cache.index_size:0] tag;	// for keeping tag of ceurrent address

ram ram();
cache cache();

initial
	begin
		index = 0;
		tag = 0;
		prev_address = 0;
		prev_data = 0;
		prev_mode = 0;
	end

always @(posedge clk)
begin
	//check if the new input is updated
	if (prev_address != address || prev_data != data || prev_mode != mode)
		begin
			prev_address = address % ram.size;
			prev_data = data;
			prev_mode = mode;
			
			tag = prev_address >> cache.index_size;	// tag = first bits of address except index ones (In our particular case - 6)
			index = address % cache.size; 		// index value = last n (n = size of cache) bits of address
				
			if (mode == 1)
				begin
					ram.ram[prev_address] = data;
					//write new data to the relevant cache block if there is such one
					if (cache.valid_array[index] == 1 && cache.tag_array[index] == tag)
						cache.cache[index] = data;
				end
			else
				begin
					//write new data to the relevant cache's block, because the one we addressing to will be possibly addressed one more time soon
					if (cache.valid_array[index] != 1 || cache.tag_array[index] != tag)
						begin
							cache.valid_array[index] = 1;
							cache.tag_array[index] = tag;
							cache.cache[index] = ram.ram[prev_address];
						end
					temp_out = cache.cache[index];
				end	
		end
end

assign out = temp_out;

endmodule 
