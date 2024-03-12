/*
* Copyright 2018 ARDUINO SA (http://www.arduino.cc/)
* This file is part of Vidor IP.
* Copyright (c) 2018
* Authors: Dario Pennisi
*
* This software is released under:
* The GNU General Public License, which covers the main part of 
* Vidor IP
* The terms of this license can be found at:
* https://www.gnu.org/licenses/gpl-3.0.en.html
*
* You can be released from the requirements of the above licenses by purchasing
* a commercial license. Buying such a license is mandatory if you want to modify or
* otherwise use the software for commercial activities involving the Arduino
* software without disclosing the source code of your own applications. To purchase
* a commercial license, send an email to license@arduino.cc.
*
*/

module PWM #(
  parameter pCHANNELS=16,
  parameter pPRESCALER_BITS=32,
  parameter pMATCH_BITS=32

) 
(
  input                              iCLK,
  input                              iRESET,
  
  input [$clog2(2*pCHANNELS+2)-1:0]  iADDRESS,
  input [31:0]                       iWRITE_DATA,
  input                              iWRITE,
  
  output reg [pCHANNELS-1:0]         oPWM
);

// register declaration  
reg [pPRESCALER_BITS-1:0] rPRESCALER_CNT;
reg [pPRESCALER_BITS-1:0] rPRESCALER_MAX;

reg [pMATCH_BITS-1:0] rPERIOD_CNT;
reg [pMATCH_BITS-1:0] rPERIOD_MAX;
reg [pMATCH_BITS-1:0] rMATCH_H [pCHANNELS-1:0];
reg [pMATCH_BITS-1:0] rMATCH_L [pCHANNELS-1:0];
reg rTICK;

integer i;

always @(posedge iCLK)
begin
  // logic to interface with bus.
  // register map is as follows:
  // 0: prescaler value
  // 1: PWM period
  // even registers >=2: value at which PWM output is set high
  // odd registers >=2: value at which PWM output is set low
  if (iWRITE) begin
    // the following statement is executed only if address is >=2. case on iADDRESS[0]
    // selects if address is odd (iADDRESS[0]=1) or even (iADDRESS[0]=0)
    if (iADDRESS>=2) case (iADDRESS[0])
      0: rMATCH_H[iADDRESS[$clog2(pCHANNELS):1]-1]<= iWRITE_DATA;
      1: rMATCH_L[iADDRESS[$clog2(pCHANNELS):1]-1]<= iWRITE_DATA;
    endcase
    else begin
      // we get here if iADDRESS<2
	    case (iADDRESS[0])
		    0: rPRESCALER_MAX<=iWRITE_DATA;
		    1: rPERIOD_MAX<=iWRITE_DATA;
		  endcase
    end
  end
        
  // prescaler is always incrementing       
  rPRESCALER_CNT<=rPRESCALER_CNT+1;
  rTICK<=0;
  if (rPRESCALER_CNT>= rPRESCALER_MAX) begin
    // if prescaler is equal or greater than the max value
    // we reset it and set the tick flag which will trigger the rest of the logic
    // note that tick lasts only one clock cycle as it is reset by the rTICK<= 0 above
    rPRESCALER_CNT<=0;
    rTICK <=1;
  end
  if (rTICK) begin
    // we get here each time rPRESCALER_CNT is reset. from here we increment the PWM
    // counter which is then clocked at a lower frequency.
    rPERIOD_CNT<=rPERIOD_CNT+1;
    if (rPERIOD_CNT>=rPERIOD_MAX) begin
      // and of course we reset the counter when we reach the max period.
      rPERIOD_CNT<=0;
    end
  end

  // this block implements the parallel comparators that actually generate the PWM outputs
  // the for loop actually generates an array of logic that compares the counter with
  // the high and low match values for each channel and set the output accordingly.
  for (i=0;i<pCHANNELS;i=i+1) begin
    if (rMATCH_H[i]==rPERIOD_CNT)
      oPWM[i] <=1;
    if (rMATCH_L[i]==rPERIOD_CNT)
      oPWM[i] <=0;
  end
end

endmodule
