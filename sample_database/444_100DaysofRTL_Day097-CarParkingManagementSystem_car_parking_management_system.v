// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module car_parking_management(
    input clk, rst, sense_entry, sense_exit,
    input [1:0] password_1, password_2,
    output reg green_light, red_light,
    output reg [6:0] hex_1, hex_2,
    output reg [3:0] space_available, space_utilized, count_cars
    );

    reg [3:0] overall_space=4'b1000;
    reg [2:0] current_state, next_state;
    reg [1:0] wait_time;

    //declaring parameters list
    parameter idle = 3'b000, 
              wait_time_state=3'b001, 
              password_correct=3'b010, 
              password_incorrect=3'b011, 
              stop=3'b100;

    //declarimg current state			 
    always@(posedge clk) begin
        if(rst==1) current_state<= idle; 
        else current_state<= next_state;
    end

//parking space management
    always@(posedge clk) begin
    
        if(rst==1) begin //reseting whole design
            space_available<= overall_space;
            space_utilized<= 0;
            count_cars<=4'b0; 
        end
        
        else begin
            if ((sense_entry==1) && (space_available>0))begin //entry of 1 vehicle
                space_available<= space_available - 3'b001;
                space_utilized<= space_utilized + 3'b001; 
                count_cars<=count_cars + 4'b0001; 
            end
            
            else if ((sense_exit==1) && (space_utilized>0)) begin //exit of 1 vehicle
                space_available<= space_available + 3'b001;
                space_utilized<= space_utilized - 3'b001; 
                count_cars<= count_cars - 4'b0001; 
            end
            
            else begin //no vehicle entered and exited
                space_available<= overall_space;
                space_utilized<= 0;
                count_cars<=4'b0; 
            end
        end
    end

    //declarationn of wait_timeing period in the wait_time_state
    always@(posedge clk) begin
    
        if(rst==1) wait_time<= 2'b0;
        
        else begin 
            if(current_state==wait_time_state) wait_time<= wait_time + 2'b01;
            else wait_time<= 2'b0;
        end
    end

    //declaration of next state
    always@(*) begin
    case(current_state)
        
        idle: begin
            if((sense_entry==1) && (space_available>0)) next_state<= wait_time_state;
            else next_state<= idle;
        end
    
        wait_time_state: begin
            if(wait_time<= 3'b011) next_state<= wait_time_state;
            else begin
                if ((password_1==2'b01) && (password_2==2'b01)) next_state<= password_correct;
                else next_state<= password_incorrect;
            end
        end
    
        password_correct: begin
            if((sense_entry==1) && (sense_exit==1)) next_state<= stop;
            else if((sense_exit==1)) next_state<= idle;
            else next_state<= password_correct;
        end
    
        password_incorrect: begin
            if((password_1==2'b01) && (password_2==2'b01)) next_state<= password_correct;
            else next_state<= password_incorrect;
        end
    
        stop: begin 
            if((password_1==2'b01) && (password_2==2'b01)) next_state<= password_correct;
            else next_state<= stop;
        end
    
        default: next_state<= idle;
    
    endcase
    end

    always@(posedge clk) begin
    case(current_state)
    
        idle: begin //starting state with no entry and exit of vehicles
            green_light<= 1'b0;
            red_light<= 1'b0;
            hex_1<= 7'b0000000; //0
            hex_2<= 7'b0000000; //0
        end
    
        wait_time_state: begin //vechile wait_timeing in the lobby
            green_light<= ~green_light;
            red_light<= 1'b0;
            hex_1<= 7'b1111001; //alphabet-E
            hex_2<= 7'b0110111; //N -> ENTER
        end
    
        password_correct: begin //vehicle entering and providing password_correct
            green_light<= 1'b1;
            red_light<= 1'b0;
            hex_1<= 7'b1111001; //6
            hex_2<= 7'b0000000; //0 -> GO
        end
    
        password_incorrect: begin //vehicle entering and providing password_incorrect
            green_light<= 1'b0;
            red_light<= 1'b1;
            hex_1<= 7'b1111001; //E
            hex_2<= 7'b1111001; //E -> ERROR
        end
        
        stop: begin //stay of the vehicle for some period
            green_light<= 1'b0;
            red_light<= ~red_light;
            hex_1<= 7'b1101101; //5
            hex_2<= 7'b1110011; //P -> STOP
        end
    
    endcase
    end
endmodule
