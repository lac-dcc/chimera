// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module shift_reg

#(parameter DATA_WIDTH=8,
parameter LENGTH=4)

(

input clock,
input reset_n,
input [1:0] ctrl_code,

input [DATA_WIDTH*LENGTH-1:0] data_in,
input [DATA_WIDTH-1:0] data_write,
output reg [DATA_WIDTH-1:0] data_read,
output reg [DATA_WIDTH*LENGTH-1:0] data_out

);

localparam REG_UPLOAD = 0,
                REG_LOAD = 1,
                REG_WRITE = 2,
                REG_READ = 3; //Gray coding of states

reg [DATA_WIDTH*LENGTH-1:0] contents;

always @(posedge clock)
begin
    if (~reset_n)
    begin
        contents <= {DATA_WIDTH*LENGTH{1'b0}};
    end
    else
    begin
    case (ctrl_code)
    REG_UPLOAD: data_out <= contents;
    REG_LOAD: contents <= data_in;
    REG_READ: begin contents <= {contents[DATA_WIDTH-1:0],contents[DATA_WIDTH*LENGTH-1:DATA_WIDTH]}; data_read <= contents[DATA_WIDTH-1:0]; end
    REG_WRITE: contents <= {data_write,contents[DATA_WIDTH*LENGTH-1:DATA_WIDTH]};
    endcase
    end

end

endmodule