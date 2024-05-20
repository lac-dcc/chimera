// This program was cloned from: https://github.com/ika-musume/ArcadeStuffs
// License: GNU General Public License v2.0

module PageRegisterController
(
    input   wire            nRESET,
    input   wire            CLK,

    input   wire            nRD,
    input   wire            nWR,
    input   wire            nCS,
    input   wire            MODE, //A0
    input   wire    [2:0]   DATA, //D0-D2
    
    output  reg     [2:0]   PAGEREG = 3'b0
);

/*
T                        1   2   3   1   2   3   1   2   3   1   2   3  
CLK                 ____/¯\_/¯\_/¯\_/¯\_/¯\_/¯\_/¯\_/¯\_/¯\_/¯\_/¯\_/¯\_/
ADDRESS             ----X-(ADDRESS)-X-(ADDRESS)-X-(ADDRESS)-X-(ADDRESS)-X
A0                  ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\___________/¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
A0 LATCHED          ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\___________/¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
RD                  ¯¯¯¯¯¯\_______/¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\_______/¯¯
WR                  ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\___/¯¯¯¯¯¯¯\___/¯¯¯¯¯¯¯¯¯¯¯¯¯¯
CS                  ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\___________________________________/
RD+WR SYNCED        ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\WR_/¯¯¯\RD_____/
*/

reg             page_reg_mode = 1'b1;
wire            page_reg_load = (nCS | MODE) | nWR;
reg             page_reg_increase;
reg             page_reg_control_tick = 1'b1;

//mode latch
always @(negedge CLK)
begin
    if(nCS == 1'b0)
    begin
        page_reg_mode <= MODE;
    end
    else
    begin
        page_reg_mode <= page_reg_mode;
    end
end

//increase signal synchronizer 
always @(posedge CLK)
begin
    page_reg_increase <= (nCS | ~MODE) | (nRD & nWR); //active low
end

//page register control signal multiplexer
always @(*)
begin
    case (page_reg_mode)
        1'b0:
        begin
            page_reg_control_tick <= page_reg_load | nCS;
        end
        1'b1:
        begin
            page_reg_control_tick <= page_reg_increase | nCS;
        end
    endcase
end

//page register data control
always @(negedge nRESET or posedge page_reg_control_tick)
begin
    if(nRESET == 1'b0)
    begin
        PAGEREG <= 3'd0;
    end
    else
    begin
        if(page_reg_mode == 1'b0)
        begin
            PAGEREG <= DATA;
        end
        else
        begin
            if(PAGEREG < 3'd7)
            begin
                PAGEREG <= PAGEREG + 3'd1;
            end
            else
            begin
                PAGEREG <= 3'd0;
            end
        end
    end
end
endmodule