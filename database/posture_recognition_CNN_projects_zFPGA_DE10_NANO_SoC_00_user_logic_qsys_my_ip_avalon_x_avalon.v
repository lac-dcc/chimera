// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

module avalon_x_avalon
#(  parameter   ADDR_WIDTH = 32,
    parameter   DATA_WIDTH = 32
)
(
    // clk/reset_n
    input                           clk, rst_n,
    // master
    input       [ADDR_WIDTH-1:0]    master_address,
    output                          master_ready,
    input       [DATA_WIDTH-1:0]    master_write_data,
    input                           master_write_req,
    input                           master_read_req,
    output      [DATA_WIDTH-1:0]    master_read_data,
    output                          master_read_data_valid,
    // slave
    output      [ADDR_WIDTH-1:0]    slave_address,
    input                           slave_ready,
    output      [DATA_WIDTH-1:0]    slave_write_data,
    output                          slave_write_req,
    output                          slave_read_req,
    input       [DATA_WIDTH-1:0]    slave_read_data,
    input                           slave_read_data_valid
);

    // ֱͨ
    assign      slave_address = master_address;
    assign      master_ready = slave_ready;
    assign      slave_write_data = master_write_data;
    assign      slave_write_req = master_write_req;
    assign      slave_read_req = master_read_req;
    assign      master_read_data = slave_read_data;
    assign      master_read_data_valid = slave_read_data_valid;


endmodule