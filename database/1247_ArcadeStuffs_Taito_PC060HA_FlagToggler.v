// This program was cloned from: https://github.com/ika-musume/ArcadeStuffs
// License: GNU General Public License v2.0

module FlagToggler
(
    input   wire            nRESET,     //active low
    input   wire            RESETTICK,  //at posedge
    input   wire            SETTICK,    //at posedge
    //output  reg             FLAGOUT     //active high
    output  wire             FLAGOUT
);


/* ORIGINAL GATE IMPLEMENTATION 
reg     flagreset_DFF_Q;
wire    flagset_DFF_R = ~(flagreset_DFF_Q | ~nRESET);

//Flag reset DFF
always @(negedge FLAGOUT or posedge RESETTICK)
begin
    if(FLAGOUT == 1'b0)
    begin
        flagreset_DFF_Q <= 1'b0;
    end
    else
    begin
        flagreset_DFF_Q <= 1'b1;   
    end
end

//Flag set DFF
always @(negedge flagset_DFF_R or posedge SETTICK)
begin
    if(flagset_DFF_R == 1'b0)
    begin
        FLAGOUT <= 1'b0;
    end
    else
    begin
        FLAGOUT <= 1'b1;   
    end
end
*/



/* NOPE */
reg     setReg = 1'b0;
reg     resetReg = 1'b0;
assign  FLAGOUT = setReg ^ resetReg;


//set reg
always @(posedge SETTICK)
begin
    if(FLAGOUT == 1'b0)
    begin
        setReg <= ~setReg;
    end
    else
    begin
        setReg <= setReg;
    end
end

//reset reg
always @(negedge nRESET or posedge RESETTICK)
begin
    if(nRESET == 1'b0)
    begin
        if(FLAGOUT == 1'b1)
        begin
            resetReg <= ~resetReg;
        end
        else
        begin
            resetReg <= resetReg;
        end
    end
    else
    begin
        if(FLAGOUT == 1'b1)
        begin
            resetReg <= ~resetReg;
        end
        else
        begin
            resetReg <= resetReg;
        end
    end
end
endmodule