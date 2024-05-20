// This program was cloned from: https://github.com/BatuCem/tt06-mnslab-bldc-0
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University MNS Labs
// Engineer: 
// 
// Create Date: 17.01.2024 11:44:23
// Design Name: BLDC
// Module Name: I2C_SLAVE_1
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module I2C_SLAVE_1#(parameter debounce = 5)(
    input clk,
    input rst,
    // I2C Ports
    input scl,
    //inout sda,
    input sda_in,
    output sda_out,
    output sda_oe,
    // RAM control signals 
    output write,
    output read_1,
    output reg [7:0] index_1,
    output [7:0] data_out,
    input [7:0] data_in,
    // control signals
    output reg busy,
    output reg valid
    );
    
    assign write = (!data_will_send && valid && !send_operation) ? (1'b1) : (1'b0);
    assign data_out = temp_data;
    
    assign read_1 = ((data_will_send && bit_count==5'd18) || (data_will_send && bit_count==5'd9)) ? (1'b1) : (1'b0);
    assign sda_oe = ~ sda_enable_reg ;
    
    localparam TIME_THDSTA  =5; 
    localparam TIME_TLOW    =5;
    localparam I2CBITS      =29;
    
    
    reg [6:0] I2C_SLAVE_ADDR;
    
    reg [7:0] i2c_data;
    reg [28:0] i2c_capt;
    
    reg [31:0]counter;
    reg counter_reset;
    reg send_operation;
    
    reg [4:0] bit_count;
    reg [7:0] temp_data;
    reg capture_en;
    
    reg ack_sended;
    reg nack_sended;
    reg half_ok;
    reg data_will_send;
    reg received_one;
    
    reg sda_en;
    reg done_high;
    reg sda_enable_reg ;
    
    reg [31:0] t_high;
    wire [31:0] t_high_2 = t_high>>1;
    reg [31:0] t_low;
    wire [31:0] t_low_2 = t_low>>1;
    reg captured;
    reg distance;
    reg sda_high;
    reg restart;
    
    reg scl_reg;
    reg [debounce-1:0] scl_shift_reg;
    reg sda_reg;
    reg [debounce-1:0] sda_shift_reg;
    
    assign sda_out = (sda_en) ? (1'b1) : (1'b0);
    
    reg [2:0] fsm_state;
    parameter IDLE  = 0;
    parameter START = 1;
    parameter TLOW  = 2;
    parameter THIGH = 3;
    parameter TSTO  = 4;
    
    always @(posedge clk)begin
        if (rst)begin
        
            I2C_SLAVE_ADDR  <= 7'h72;
            temp_data       <= 8'b0;
            index_1         <= 8'b0;
            send_operation  <= 1'b0;
            
            scl_reg         <= 1'b1;
            scl_shift_reg   <= {debounce{1'b1}};
            sda_reg         <= 1'b1;
            sda_shift_reg   <= {debounce{1'b1}};
            
            sda_en          <= 1'b1;
            counter_reset   <= 1'b0;
            counter         <= 32'b0;
            bit_count       <= 5'b0;
            captured        <= 1'b0;
            distance        <= 1'b0;
            sda_high        <= 1'b0;
            restart         <= 1'b0;
            done_high       <= 1'b0;
            
            t_high          <= 32'b0;
            t_low           <= 32'b0;
            
            fsm_state       <= 3'b0;
            busy            <= 1'b0;
            valid           <= 1'b0;
            data_will_send  <= 1'b0;
            received_one    <= 1'b0;
            
            i2c_data        <= 8'b0;
            i2c_capt        <= 29'b0;
            
            ack_sended      <= 1'b0;
            nack_sended     <= 1'b0;
            half_ok         <= 1'b0;
            sda_enable_reg  <= 1'b1;
        end
        else begin
        
            scl_shift_reg <= {scl_shift_reg[debounce-2:0],scl};
            
            if (scl_shift_reg == {debounce{1'b0}} || scl_shift_reg == {debounce{1'b1}})begin
                scl_reg <= scl_shift_reg[0];
            end
        
            sda_shift_reg <= {sda_shift_reg[debounce-2:0],sda_in};
            
            if (sda_shift_reg == {debounce{1'b0}} || sda_shift_reg == {debounce{1'b1}})begin
                sda_reg <= sda_shift_reg[0];
            end
            
            capture_en <= i2c_capt[I2CBITS - bit_count - 1];
            
            if((data_will_send && !received_one && (bit_count==5'd18)) || (data_will_send && !received_one && (bit_count==5'd9) && restart))begin
                i2c_data <= data_in;
                received_one <= 1'b1;
            end
            if(counter_reset)begin
                counter <= 32'b0;
                counter_reset <= 1'b0;
            end
            else begin
                counter <= counter + 1'b1;
            end
            case (fsm_state)
                IDLE:begin
                    sda_en <= 1'b1;
                    sda_enable_reg <= 1'b1;
                    if ((counter == (t_high + t_low)) || distance )begin
                        i2c_capt        <= {1'b0, 8'hFF,   1'b0, 8'hFF,    1'b0, 8'hFF,  1'b0, 1'b0};
                        send_operation  <= 1'b0;
                        bit_count       <= 5'b0;
                        ack_sended      <= 1'b0;
                        nack_sended     <= 1'b0;
                        received_one    <= 1'b0;
                        distance        <= 1'b1;
                        busy            <= 1'b0;
                        sda_high        <= 1'b0;
                        restart         <= 1'b0;
                        valid           <= 1'b0;
                        captured        <= 1'b0;
                        counter_reset   <= (scl_reg && !sda_reg) ? (1'b0) : (1'b1);
                        fsm_state       <= (scl_reg && !sda_reg) ? (START) : (IDLE);
                    end
                end
                START:begin
                    distance <= 1'b0;
                    done_high <= 1'b0;
                    if(!scl_reg)begin
                        if(counter >= TIME_THDSTA)begin
                            fsm_state <= TLOW;
                            busy <= 1'b1; 
                            t_high <= (restart) ? (t_high) : (counter);
                            counter_reset <= 1'b1;
                        end
                        else begin
                            fsm_state <= IDLE;
                            counter_reset <= 1'b1;
                        end
                    end
                    if(sda_reg)begin
                        fsm_state <= IDLE;
                        counter_reset <= 1'b1;
                    end
                end
                TLOW:begin
                    if(scl_reg)begin
                        if(counter >= TIME_TLOW)begin
                            bit_count <= (restart && (bit_count==5'd9)) ? (5'd19) : (bit_count + 1'b1);
//                            fsm_state <= THIGH;
                            fsm_state <= (bit_count == I2CBITS-2) ? (TSTO) : (THIGH);
                            t_low <= counter;
                            captured <= 1'b1;
                            counter_reset <= 1'b1;
                        end
                        else begin
                            fsm_state <= IDLE;
                            counter_reset <= 1'b1;
                        end
                    end
                    if(captured)begin
                        if(counter == t_low_2)begin
                            if((data_will_send && (bit_count>17) && (bit_count<28)) || (data_will_send && (bit_count==5'd9)))begin
                                sda_en  <= (bit_count==5'd9) ? (i2c_data[7]) : (i2c_data[I2CBITS - bit_count - 4]);// problem in here
                                sda_enable_reg <= 1'b0;
                            end
                            else if(((bit_count==5'd8) || (bit_count==5'd17) || (bit_count==5'd26)))begin
                                if(ack_sended)begin
                                    sda_en <= 1'b0;
                                    sda_enable_reg <= 1'b0;
                                end
                                else if(nack_sended)begin
                                    sda_en <= 1'b1;
                                    sda_enable_reg <= 1'b0;
                                    fsm_state <= TSTO;
                                    counter_reset <= 1'b1;
                                end
                            end
                            else begin
                                sda_en <= 1'b1;
                                sda_enable_reg <= 1'b1;
                            end
                        end
                        else if ((counter >= (t_low<<3)) && !counter_reset)begin
                            fsm_state <= IDLE;
                            counter_reset <= 1'b1;
                        end
                    end
                end
                THIGH:begin
                    if(scl_reg && sda_reg && !restart && (bit_count == 5'd19))begin
                        sda_high <= 1'b1;
                    end
                    else if (scl_reg && !sda_reg && sda_high && !restart && (bit_count == 5'd19))begin
                        sda_high <= 1'b0;
                        restart <= 1'b1;
                        fsm_state <= START;
                        half_ok <= 1'b0;
                        bit_count <= 5'b0;
                    end
                    
                    if(!scl_reg && done_high)begin
                        fsm_state <= (TLOW);
                        done_high <= 1'b0;
                    end
                    
                    if((counter == t_high_2) && !done_high )begin
                        if((bit_count==5'd8) && half_ok)begin
                            if(temp_data[7:1]==I2C_SLAVE_ADDR)begin
                                ack_sended <= 1'b1;
                                i2c_capt  <= (!temp_data[0]) ? ({1'b0, 8'hFF,1'b0,   8'hFF,1'b0,   8'hFF,1'b0,   1'b0}): // write
                                                               ({1'b0, 8'hFF,1'b0,   8'hFF,1'b0,   8'h00,1'b0,   1'b0}); // read
                                data_will_send <= (!temp_data[0]) ? (1'b0) : (1'b1);
                                send_operation <= (!temp_data[0]) ? (send_operation) : (1'b1);
                            end
                            else begin
                                nack_sended <= 1'b1;
                            end
                        end
                        else if ((bit_count==5'd17) && half_ok)begin
                            if((temp_data>=8'h40) && (temp_data<=8'h53))begin
                                ack_sended <= 1'b1;
                                index_1 <= temp_data;
                            end
                            else begin
                                nack_sended <= 1'b1;
                            end
                        end
                        else if ((bit_count==5'd26) && half_ok)begin
                            data_will_send <= 1'b0;
                            ack_sended <= 1'b1;
                        end
                        else begin
                            ack_sended <= 1'b0;
                        end
                        
                        if(capture_en && !half_ok)begin
                            temp_data <= (temp_data << 1) | {7'b0,sda_reg};
                        end
                        half_ok <= ~half_ok;
                        done_high <= (half_ok);
                        if (!half_ok)begin
                            fsm_state <= (THIGH);
                        end
                        counter_reset <= 1'b1;
                    end
                    else if ((counter >= (t_high<<3)) && !counter_reset)begin
                        fsm_state <= IDLE;
                        counter_reset <= 1'b1;
                    end
                end
                TSTO:begin
                    
                    if(scl_reg && !sda_reg )begin
                        sda_high <= 1'b1;
                    end
                    else if (scl_reg && sda_reg && sda_high )begin
                        sda_high <= 1'b0;
                        fsm_state <= IDLE;
                        counter_reset <= 1'b1;
                        valid <= 1'b1;
                        busy <= 1'b0;
                    end 
                    if ((counter >= (t_high<<1)) && !counter_reset)begin
                        fsm_state <= IDLE;
                        counter_reset <= 1'b1;
                    end
                end
            endcase
        end
    end
endmodule
