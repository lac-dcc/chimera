// This program was cloned from: https://github.com/psnjk/SimpleCache
// License: MIT License

module cache();

parameter size = 64;		// cache size
parameter index_size = 6;	// index size


reg [31:0] cache [0:size - 1]; //registers for the data in cache
reg [11 - index_size:0] tag_array [0:size - 1]; // for all tags in cache
reg valid_array [0:size - 1]; //0 - there is no data 1 - there is data

initial
	begin: initialization
		integer i;
		for (i = 0; i < size; i = i + 1)
		begin
			valid_array[i] = 1'b0;
			tag_array[i] = 6'b000000;
		end
	end

endmodule 
