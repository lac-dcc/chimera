// This program was cloned from: https://github.com/aarontartz/FPGA-Temperature-Humidity-Sensor-Project
// License: MIT License

`timescale 1s / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Aaron Tartz
// 
// Create Date: 04/02/2024 04:40:53 AM
// Design Name: 
// Module Name: i2c_master
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: FPGA is master, Si7021 is slave
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module i2c_master(
    input wire clk100MHz,                      // clk driven from processor at 100MHz
    input wire [1:0] cmd_in,
    input wire sda_in,
    //input wire clk_100MHz_count,
    //input wire clk_100kHz,
    output wire sda_out,
    output wire sda_en,
    //inout wire sda,
    output wire scl_out,
    output wire [15:0] data_out,          //
    //output reg [15:0] data_out
    
    //TESTING
    output wire clk100kHz_double,
    output wire nack_ack_w
    );

    // Signal Declarations
    parameter [6:0] sensor_addr         = 7'b1000_000;      // Sensor address (add on LSB in FSM, write = 0, read = 1)
    parameter [7:0] measure_rh_cmd      = 8'b1111_0101;     // 0xF5 measure relative humidity (RH)
    parameter [7:0] measure_temp_cmd    = 8'b1111_0011;   // 0xF3 measure temp
    parameter [7:0] temp_from_rh_cmd    = 8'b1110_0000;     // 0xE0 read temp from RH
    parameter [7:0] write_user_reg_cmd  = 8'b1110_0110;     // 0xE6 write to user register               
    
    //reg [7:0] MSB_byte = 0;                                     // data MSB
    //reg [7:0] LSB_byte = 0;                                     // data LSB
    reg sda_write_en = 1;             // starts HIGH for START state
    reg o_bit = 1;
    reg i_bit = 0;
    reg nack_ack = 0;                                       // checks when slave is done converting - will nack until done
    reg [15:0] data_reg;
    //reg [15:0] temp_data;
    //reg [15:0] hum_data;	

    // State Declarations
    localparam [3:0] START          = 4'b0000,
                     START_REP      = 4'b0001,         
                     SEND_ADDR      = 4'b0010,
                     SEND_USER_REG  = 4'b0011,      // send write user register cmd
                     WRITE_USER_REG = 4'b0100,      // write to user register
                     SEND_MEAS_RH   = 4'b0101,      // send measure RH cmd
                     SEND_MEAS_TEMP = 4'b0110,
                     GET_ACK        = 4'b0111,
                     GET_NACK_ACK   = 4'b1000,
                     SEND_ACK       = 4'b1001,
                     SEND_NACK      = 4'b1010,
                     READ_MSB       = 4'b1011,
                     READ_LSB       = 4'b1100,
                     STOP           = 4'b1101;
                     
                     
    reg [4:0] state = START;    // state register
    
   // counters
    reg [2:0] index_counter_addr = 0;
    reg [2:0] index_counter_cmd = 0;
    reg [2:0] index_counter_MSB = 0;
    reg [2:0] index_counter_LSB = 0;
    reg [2:0] send_addr_counter = 0;
    reg [2:0] get_nack_ack_counter = 0;
    reg [2:0] send_nack_counter = 0;
    reg [2:0] get_ack_counter = 0;
    
    // for clk generation
    reg [9:0] clk_gen_counter = 10'b0;
    reg clk_reg = 1;
    reg clk_reg_double = 1;

    assign sda_out = sda_write_en ? o_bit : 1'bz;
    assign sda_en = sda_write_en;
    assign scl_out = clk_reg;
    
    assign clk100kHz_double = clk_reg_double;
    //assign clk100kHz = clk_reg;
    
    //assign data_out = {MSB_byte[7:0], LSB_byte[7:0]};
    assign data_out = data_reg;
    
    //TESTING
    assign nack_ack_w = nack_ack;
    //=================================
    
    always @(posedge clk100MHz) begin
        // Generate 100kHz clk for SCL
        if (clk_gen_counter == 499) begin
            clk_reg <= ~clk_reg;            // Changes 100kHz clock to LOW
        end
        else if (clk_gen_counter == 999) begin
            clk_reg <= ~clk_reg;            // Changes 100kHz clock to HIGH
        end
        // Generate 200kHz clk, doubles frequency to allow read/write when SCL is HIGH or LOW
        if (clk_gen_counter == 299 || clk_gen_counter == 799) begin     // creates phase shift to ensure SDA reads and sends values when SCL is LOW or HIGH
            clk_reg_double <= ~clk_reg_double;
        end
        else if (clk_gen_counter == 49 || clk_gen_counter == 549) begin
            clk_reg_double <= ~clk_reg_double;
        end
        clk_gen_counter <= clk_gen_counter + 1;
        if (clk_gen_counter == 499)
            clk_gen_counter <= 9'd500;      // have to put this to keep clks synchronized
        else if (clk_gen_counter == 999)
            clk_gen_counter <= 9'd0;
    end
    
    always @(negedge clk100kHz_double) begin     // double frequency of 100kHz clk, allows for posedge and negedge functions of 100kHz
        case (state)
            START: begin
                if (clk_gen_counter < 499) begin
                    sda_write_en <= 1;
                    //sda_write_en <= 1;
                    // to start I2C, pull SDA LOW while SCL HIGH
                    o_bit <= 0;                 // send START condition  
                    send_addr_counter <= 1;     // 1 instance of sending slave addr + x instances of sending addr until conversion is complete
                    get_nack_ack_counter <= 1;
                    send_nack_counter <= 3;     // 1 instance sending nack bit + 
                    get_ack_counter <= 2;       // 2 instances of receiving ack bit + 1 instance of state acting as STOP state for START_REP
                                                // (also 1 more instance of receiving ack bit, but is in GET_NACK_ACK state)
                    
                    index_counter_addr <= 7;    // address 7 bits, + read/write bit
                    index_counter_cmd <= 7;     // measure cmd 8 bits
                    index_counter_MSB <= 7;     // MSB 8 bits
                    index_counter_LSB <= 7;     // LSB 8 bits
                    //sda_write_en <= 1;
                    state <= SEND_ADDR; 
                end
            end
            
            START_REP: begin
                if (clk_gen_counter < 499) begin
                    sda_write_en <= 1;              // same as start without initializing values
                    o_bit <= 0;
                    index_counter_addr <= 4'd7;
                    state <= SEND_ADDR;
                end
            end
            
            SEND_ADDR: begin
                if (clk_gen_counter >= 499) begin
                    sda_write_en <= 1;
                    if (index_counter_addr >= 1) begin  // sends each bit of address
                        o_bit <= sensor_addr[index_counter_addr - 1];
                        index_counter_addr <= index_counter_addr - 1;
                    end
                    else if (index_counter_addr == 0 && send_addr_counter == 1) begin
                        o_bit <= 0;                     // write bit
                        send_addr_counter <= send_addr_counter - 1;
                        state <= GET_ACK;
                    end
                    else if (index_counter_addr == 0 && send_addr_counter == 0) begin
                        o_bit <= 1;                     // read bit
                        get_nack_ack_counter <= 4'd1;
                        state <= GET_NACK_ACK;
                    end
                end
            end
            
            GET_ACK: begin;
                if (clk_gen_counter >= 499) begin
                    sda_write_en <= 0;
                    if (get_ack_counter == 2) begin
                        get_ack_counter <= get_ack_counter - 1;
                        //if (cmd_in == 2'b00)
                            state <= SEND_MEAS_TEMP;
                        //else
                            //state <= SEND_MEAS_TEMP;
                    end
                    else if (get_ack_counter == 1)
                        get_ack_counter <= get_ack_counter - 1;
                    else if (get_ack_counter == 0) begin    // Doesn't actually get ack - allows o_bit to go to 1 so START_REP can go from 1 to 0
                        sda_write_en <= 1;
                        o_bit <= 1;                         // Because ACK bit is 0, in order to start again SDA needs to go from HIGH to LOW
                        state <= START_REP;
                    end
                end
            end
            
            GET_NACK_ACK: begin
                sda_write_en <= 0;
                nack_ack <= sda_in;     // NACK = 1, ACK = 0: Slave will not send ACK until conversion is done
                if (clk_gen_counter >= 499) begin
                    if (nack_ack == 0)
                        state <= READ_MSB;
                    else if (get_nack_ack_counter == 1)
                        get_nack_ack_counter <= get_nack_ack_counter - 1;
                    else if (get_nack_ack_counter == 0) begin
                        sda_write_en <= 1;
                        o_bit <= 1;
                        state <= START_REP;
                    end
                end
            end

            SEND_MEAS_RH: begin
                if (clk_gen_counter >= 499) begin
                    sda_write_en <= 1;
                    if (index_counter_cmd >= 1) begin       // send command to measure relative humidity
                        o_bit <= measure_rh_cmd[index_counter_cmd];
                        index_counter_cmd <= index_counter_cmd - 1;
                    end
                    else if (index_counter_cmd == 0) begin
                        o_bit <= measure_rh_cmd[0];
                        state <= GET_ACK;
                    end
                end
            end
            
            SEND_MEAS_TEMP: begin
                if (clk_gen_counter >= 499) begin
                    sda_write_en <= 1;
                    if (index_counter_cmd >= 1) begin       // send command to measure relative humidity
                        o_bit <= measure_temp_cmd[index_counter_cmd];
                        index_counter_cmd <= index_counter_cmd - 1;
                    end
                    else if (index_counter_cmd == 0) begin
                        o_bit <= measure_temp_cmd[0];
                        state <= GET_ACK;
                    end
                end
            end
            
            READ_MSB: begin
                if (clk_gen_counter >= 499) begin
                    sda_write_en <= 0;
                    if (index_counter_MSB >= 1) begin
                        data_reg[index_counter_MSB + 8] <= sda_in; // store SDA in data to MSB
                        index_counter_MSB <= index_counter_MSB - 1;
                    end
                    else if (index_counter_MSB == 0) begin
                        data_reg[8] <= sda_in;
                        sda_write_en <= 1;      // Send ACK
                        o_bit <= 0;  
                        state <= READ_LSB;
                    end
                end
            end
            
            READ_LSB: begin
                if (clk_gen_counter >= 499) begin
                    sda_write_en <= 0;
                    if (index_counter_LSB >= 1) begin
                        data_reg[index_counter_MSB] <= sda_in;
                        index_counter_LSB <= index_counter_LSB - 1; // store SDA in data to LSB
                    end
                    else if (index_counter_LSB == 0 && send_nack_counter == 3) begin
                        data_reg[0] <= sda_in;
                        send_nack_counter <= send_nack_counter - 1;
                    end
                    else if (index_counter_LSB == 0 && (send_nack_counter == 2 || send_nack_counter == 1)) begin    // Allows enough time for NACK bit to be read
                        sda_write_en <= 1;
                        o_bit <= 1;
                        send_nack_counter <= send_nack_counter - 1;
                    end
                    else if (index_counter_LSB == 0 && send_nack_counter == 0) begin
                        sda_write_en <= 1;
                        o_bit <= 0;         // sets SDA line to 0 to allow STOP state to pull from LOW to HIGH
                        state <= STOP;
                    end
                end
            end

            STOP: begin
                if (clk_gen_counter < 499) begin        // set SDA to HIGH when SCL is HIGH
                    sda_write_en <= 1;
                    o_bit <= 1;
                    state <= START;
                end
            end
 
        endcase
    end
endmodule
