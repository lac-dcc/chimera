// This program was cloned from: https://github.com/sdmay24-21/ASIC-GuitarPedal
// License: Apache License 2.0

/*
memory control module

Controls both SRAM on chip and ofchip memory

First 
*/
module memorycontroller /*(
//parameter IMPULSE_LENGTH = 15'h00FF,

);*/

    (
    input clk,
    input adc_clock,
    input record,
    //input loop,
    input off_chip_mem,
    input off_chip_mem_ready,
    //input [15:0] delay_reverb,
    //input [15:0] gain,
    input unsigned [15:0] impulses,
    input wire signed [15:0] data_in,
    output reg memory_we,
    //reg [15:0]  curr_adr,
    output reg unsigned [15:0] address_out,
    output reg [15:0] data_out
    );


    parameter [15:0] ONCHIP_MAX_MEM = 16'h3FFF;
    parameter [15:0] OFFCHIP_MAX_MEM = 16'hdFF0;

    reg unsigned[15:0]  head_adr;
    reg unsigned[15:0]  tail_adr;

    reg unsigned[15:0]  curr_w_adr = ONCHIP_MAX_MEM;

    reg unsigned[10:0]  curr_impulse; //max ~500

    reg signed [31:0] output_buffer; //stores the additions of multiplier and...
    //assign data_out = output_buffer[31:16]; // top 16 bits will become our output



    


    // always @(negedge adc_clock) begin //RESET ON ADC_CLOCK
    //     output_buffer <= 0; //clear buffer

        
    //     if(record == 1'b0) begin //recording inputs
    //         address_out <= curr_adr; //
    //         memory_we <= 1'b1; //set to write to memory
    //     end         
    //     if(curr_adr + 1 == 16'hFFFF) begin
    //         curr_adr <= impulses; //Handle Overflow and go past all impulses
    //     end else begin
    //         curr_adr <= curr_adr + 1;
    //     end
    // end 

/*
if impulse count is 0x10 or 16
_____________________
|0x0 IMPULSES        |
|--------------------|
|0x10 START OF MEMORY|
|                    |
|0xFFFF              |
|____________________|
*/
    reg unsigned [15:0]  curr_r_adr;// = 16'hFFF0;

    //reg [15:0]  offset_adr;
    reg impulse_read = 0;

    reg large_jump;
    reg[5:0] jump_value;
    reg signed [8:0] impulse_multiplier;

    // assign large_jump = data_in[15];
    // assign jump_value = data_in[14:9];
    // assign impulse_multiplier = data_in[7:0];

    reg ADC_RESET;
    //wire[15:0] impulse_offset;
    //assign impulse_offset = {5'b00000,top_offset,4'b00,bottom_offset}; //offset from next impulse defined in the current impulse responce
    reg record_buffer = 0;
    always @(posedge clk) begin //clocked
        //$display("CLOCK!");
        if(adc_clock) begin //RESET ON ADC_CLOCK
            //data_out<= output_buffer[31:16]; //set data_out

            curr_impulse<= 0; //clear impulse counter
            ADC_RESET<=1;
            curr_r_adr<=curr_w_adr;
            //$display("ADC CLOCK!");
            if(record) begin //recording inputs
                if(record_buffer) begin
                    head_adr <= curr_w_adr;
                    
                end
                address_out <= curr_w_adr; //
                //memory_we <= 1'b1; //set to write to memory
                tail_adr <=curr_w_adr;
                record_buffer <= 1'b0;

                //OVERFLOW
                if((!off_chip_mem && (curr_w_adr == ONCHIP_MAX_MEM)) || (off_chip_mem && (curr_w_adr == OFFCHIP_MAX_MEM))) begin
                    curr_w_adr <= impulses; //Handle Overflow and go past all impulses
                end                    
                else begin
                    curr_w_adr <= curr_w_adr + 1;
                end
            end
            else begin
                memory_we <= 1'b0;//dont edit the memory
                record_buffer <= 1'b1;


                
            //OVERFLOW
            if(curr_w_adr + 1 == tail_adr) begin
                curr_w_adr <= head_adr;
            end
            else begin
                curr_w_adr <= curr_w_adr + 1;
            end

            

            end
        end
        else begin

           

            if(ADC_RESET) begin //NOT NEEDED?
                //output_buffer <=0;
                ADC_RESET<=0; //reset flag

                if(!output_buffer[31] && output_buffer[22]) begin //DATA OVERFLOW
                    data_out<= 16'h7FFF;
                end
                else if(output_buffer[31] && !output_buffer[22]) begin
                    data_out<= 16'h8000;
                end
                else begin
                    data_out<= output_buffer[22:7]; //set data_out data_out<= output_buffer[23:8]; //set data_out
                end
                output_buffer <=0;

                if(record) begin //edit memory whhen recording
                    memory_we <= 1'b1;// edit the memory
                end

                impulse_read <= 1'b0;//get data
                impulse_multiplier<= 0;//make sure not to add anything to output
                jump_value<=0; //no jump
                large_jump <=1;
            end 
            else begin 
           

           


            if(off_chip_mem_ready) begin
                memory_we <= 1'b0; //always disable write in reading portion of step
                if(impulse_read == 1'b1) begin //if in impulse read

                    if(curr_r_adr < impulses) begin//UNDERFLOW
                        if(off_chip_mem) begin //using off chip memory
                            address_out<=OFFCHIP_MAX_MEM + (curr_r_adr - impulses)+1;
                            curr_r_adr<=OFFCHIP_MAX_MEM + (curr_r_adr - impulses)+1;
                        end
                        else begin
                            address_out<=ONCHIP_MAX_MEM + (curr_r_adr - impulses)+1;
                            curr_r_adr<=ONCHIP_MAX_MEM + (curr_r_adr - impulses)+1;
                        end
                        
                    end
                    else begin
                        address_out <= curr_r_adr;
                    end

                        large_jump <= data_in[15];
                        jump_value <= data_in[14:9];

                        //negative = data_in[8];
                        impulse_multiplier <= data_in[8:0];
                        
                        impulse_read<= 1'b0;
                        if(curr_impulse < impulses[10:0]) begin
                            curr_impulse<= curr_impulse+1; //add one to impulse counter
                        end
                        else begin
                            curr_impulse<= curr_impulse;
                        end
                    end else begin //read the DATA specified by impulse
                        
                        

                        if(large_jump == 1'b1) begin
                            curr_r_adr <= curr_r_adr - jump_value*(2^6); //check if overflow TODO
                        end
                        else begin
                            curr_r_adr <= curr_r_adr - ({10'b0, jump_value}+1); //check if overflow TODO
                        end

                        address_out <= {5'b00000,curr_impulse};
                        output_buffer <= output_buffer + data_in*impulse_multiplier;
                        impulse_read <= 1'b1;
                    end
            end
            end
        end //ELSE WHEN NOT ADC CLOCKED
    end //ALWAYS

endmodule
