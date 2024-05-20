// This program was cloned from: https://github.com/thefranciscoflores/Traffic-Intersection-Simulator
// License: GNU General Public License v2.0

`timescale 1ns / 1ps
/*
                            TRAFFIC STATE MACHINE FOR FINAL PROJECT ECE3300L - SPRING 2024
                                            BY FRANCISCO FLORES LOPEZ
                                    CALIFORNIA POLYTECHNIC UNIVERSITY - POMONA

*/

module trafficStateMachine(CLK100MHZ, reset, NSLT_sw, EWLT_sw, NSPED_bttn, EWPED_bttn, NScount, EWcount, NS_LED, EW_LED, NSLT_LED, EWLT_LED, playSound ,NSPED_request, EWPED_request);

    input CLK100MHZ, reset;         //1 HZ CLOCK and POSEDGE TRIGGERED RESET
    input NSLT_sw, EWLT_sw;         // North-South Left Turn and East-West Left Turn switches.
    input NSPED_bttn, EWPED_bttn;       // North-South and Eeast-West Pedestrian Buttons

    output reg [2:0] NS_LED, EW_LED;        // Output driving LED colors
    output reg NSLT_LED, EWLT_LED;          //North-South Left Turn LED and East-West Left Turn LED
    output reg [3:0] NScount, EWcount;      // Pedestrian register to drive 7-segment display
    output reg playSound = 0;                   //Beep-playing Flag
    
    //FOR PEDESTRIAN REQUEST MANAGEMENT (FLAG BIT)
    output reg NSPED_request, EWPED_request;

    // -------------------------------------STATE MACHINE ---------------------------------------
    /*
        To understand how our project will work, we need to understand all the possible states that the intersection 
        can have. These are the following:  
            - Standard functioning traffic light: NS_LED and EW_LED will flash
                * NS = GREEN    & EW = RED
                * NS = YELLOW   & EW = RED
                * NS = RED      & EW = GREEN
                * NS = RED      & EW = YELLOW
                (4 states total)
                   
            - If either NSLT_sw or EWLT_sw is on then we add two additional states:
                * NSLT 
                * EWLT
                (2 states total)
    */
    localparam NS_GREEN_EW_RED = 3'b000, 
               NS_YELLOW_EW_RED = 3'b001,
               NS_RED_EW_GREEN = 3'b010,
               NS_RED_EW_YELLOW = 3'b011,
               EWLT = 3'b100,
               NSLT = 3'b101;
    
    //DEFINITIONS FOR LED
    //localparam RED = 3'b100, YELLOW = 3'b010, GREEN = 3'b001;
   // localparam OFF = 1'b0, ON = 1'b1;
                              
    reg [2:0] state_reg; //CHANGE TO 'OUTPUT REG' IF WE DESIRE TO SIMULATE AND OBSERVE THE CURRENT STATE
    reg [6:0] counter;  //CCHANGE TO 'OUTPUT REG' IF WE DESIRE TO SIMULATE AND OBSERVE THE CURRENT COUNTER
    
    wire CLK1HZ;        //SLOW CLOCK SIGNAL
    
    
  
    
    
    //SLOW CLOCK
        slowerClkGen
    #(.N(100_000_000)) clk1
    (CLK100MHZ, reset, CLK1HZ);
    
    
    
   //Initial State Logic
    always @(posedge CLK1HZ or posedge reset)   //CHANGE TO CLK100MHZ FOR SIMULATION PURPOSES 
    begin
        if (reset)
        begin
            counter <= 0;
            state_reg <= NS_GREEN_EW_RED;
            NSPED_request <= 0;
            EWPED_request <= 0;
        end
        else  
        begin
            if (NSPED_bttn) NSPED_request <= 1;
            if (EWPED_bttn) EWPED_request <= 1;
            counter <= (counter == 41) ? 0 : counter + 1; 

                    case(state_reg)
                    NS_GREEN_EW_RED:
                        begin 
                            if(counter == 12)
                                begin
                                     state_reg <= NS_YELLOW_EW_RED;
                                     NSPED_request <= 0;
                                end 
                        end

                    NS_YELLOW_EW_RED:
                    begin
                            if(EWLT_sw == 1 && counter == 15) state_reg <= EWLT;
                        else if (counter == 15 && EWLT_sw == 0) 
                            begin 
                                counter <= counter + 6 ; 
                                state_reg <=  NS_RED_EW_GREEN; 
                            end
                    end

                    NS_RED_EW_GREEN:
                    begin
                            if(counter == 33) 
                            begin
                                state_reg <= NS_RED_EW_YELLOW;
                                EWPED_request <= 0;
                            end
                    end

                    NS_RED_EW_YELLOW:
                    begin
                            if(NSLT_sw == 1 && counter == 36) state_reg <= NSLT;
                            else if (counter == 36 && NSLT_sw == 0) 
                            begin 
                                counter <= 0 ; 
                                state_reg <=  NS_GREEN_EW_RED; 
                            end 
                    end

                    NSLT:
                    begin
                            if(counter == 41) state_reg <= NS_GREEN_EW_RED;
                    end

                    EWLT:
                    begin
                            if(counter == 20) state_reg <= NS_RED_EW_GREEN;
                    end

                    default: state_reg <= NS_GREEN_EW_RED;
                    endcase 
            
            end
                
    end
    

    //Next-State and Output Logic
    always @(*) //It triggers automatically with every variable
    begin
        case(state_reg)
            NS_GREEN_EW_RED:                             //NS = GREEN & EW = RED
            begin
                NS_LED = 3'b001;
                EW_LED = 3'b100;
                NSLT_LED = 1'b0; 
                EWLT_LED = 1'b0;
                
                EWcount = 15;
                
                if(NSPED_request)               
                begin
                    playSound = 1;
                    if(counter == 0) NScount = 9;
                    if(counter == 1) NScount = 8;
                    if(counter == 2) NScount = 7;
                    if(counter == 3) NScount = 6;
                    if(counter == 4) NScount = 5;
                    if(counter == 5) NScount = 4;
                    if(counter == 6) NScount = 3;
                    if(counter == 7) NScount = 2;
                    if(counter == 8) NScount = 1;
                    if(counter == 9) NScount = 0;
                    if(counter == 10) begin NScount = 0; playSound = 0; end
                    if(counter == 11) begin NScount = 0; playSound = 0; end
                    if(counter == 12) begin NScount = 0; playSound = 0; end
                    if(counter == 13) begin NScount = 0; playSound = 0; end
                end
                else begin NScount = 15; playSound = 0; end
            end
            
            NS_YELLOW_EW_RED:                           //NS = YELLOW & EW = RED
            begin
                NS_LED = 3'b010;
                EW_LED = 3'b100;
                NSLT_LED = 1'b0; 
                EWLT_LED = 1'b0;
                
                NScount = 15; EWcount = 15;   
                playSound = 0;
         
            end
            
            NS_RED_EW_GREEN:                            //NS = RED & EW = GREEN
            begin
                NS_LED = 3'b100;
                EW_LED = 3'b001;
                NSLT_LED = 1'b0; 
                EWLT_LED = 1'b0;
                
                NScount = 15;
                
                if(EWPED_request)               
                begin
                    playSound = 1;
                    if(counter == 21) EWcount = 9;
                    if(counter == 22) EWcount = 8;
                    if(counter == 23) EWcount = 7;
                    if(counter == 24) EWcount = 6;
                    if(counter == 25) EWcount = 5;
                    if(counter == 26) EWcount = 4;
                    if(counter == 27) EWcount = 3;
                    if(counter == 28) EWcount = 2;
                    if(counter == 29) EWcount = 1;
                    if(counter == 30) EWcount = 0;
                    if(counter == 31) begin EWcount = 0; playSound = 0; end
                    if(counter == 32) begin EWcount = 0; playSound = 0; end
                    if(counter == 33) begin EWcount = 0; playSound = 0; end
                    if(counter == 34) begin EWcount = 0; playSound = 0; end
                end
                else begin 
                    EWcount = 15; 
                    playSound = 0; 
                    end
            end
            
            NS_RED_EW_YELLOW:                       //NS = RED & EW = YELLOW
            begin
                NS_LED = 3'b100;
                EW_LED = 3'b010;
                NSLT_LED = 1'b0; 
                EWLT_LED = 1'b0;
                
                NScount = 15; EWcount = 15;
                playSound = 0;
            end
            
            NSLT:                                   //NS = RED & EW = RED
            begin
                NS_LED = 3'b100;
                EW_LED = 3'b100;
                NSLT_LED = 1'b1; 
                EWLT_LED = 1'b0;
                
                playSound = 0;
                NScount = 15; EWcount = 15;
            end
            
            EWLT:                                   //NS = RED & EW = RED
            begin
                NS_LED = 3'b100;
                EW_LED = 3'b100;
                NSLT_LED = 1'b0; 
                EWLT_LED = 1'b1;
                   
                playSound = 0;
                NScount = 15; EWcount = 15;
            end
        endcase
    end   
endmodule
