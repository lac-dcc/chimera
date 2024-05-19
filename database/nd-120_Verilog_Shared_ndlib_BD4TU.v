// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/*******************************************************************************
 ** Component : BD4TU                                                         **
 **                                                                           **
 ** Databufffer with 3-state                                                  **
 ** Used in CGA (Sheet 5/10) page 6                                           **
 **                                                                           **
 ** In the drawings the read bufffer is connected to "PTREE1" for read-enable **
 ** Which is connected to 1/HIGH. Not really sure what thus migth mean.       **
 **                                                                           **
 ** Ronny Hansen 14.01.2023                                                   **
 ******************************************************************************/

module BD4TU( input wire A,
              inout wire IO, // Buffer input/output            
              input wire EN,  // Enable. H= READ from BUF to ZI, L= WRITE from A to BUF
              input wire TN,  // Test ? Connected to PTSTN, which is always 1/HIGH
              output wire ZI  //Z-INPUT
);


    reg internalData; // Internal data register
    reg ZI_REG; // ZI register

    // Bidirectional data operation
    assign IO = (EN == 1'b0) ? internalData : 1'b0;

    //assign ZI = BUF   
    assign ZI = TN ?  ZI_REG : 1'b0; // Probably the correct implementation ?
   
    always @* begin
        if (EN == 1'b0) begin
            // Write A to BUF
            internalData <= A;
        end
        else begin
            // Read BUF to ZI (Verilog will read from the BUF wire even i we have set it to three-state (ie not driving it, but we can still read)
            internalData <= IO;
        end
    end


  


endmodule
