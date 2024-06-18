// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// 44306A,21G,MMUCTL - MMU CONTROL LOGIC


module PAL_44306A(
    input CA0, WRITE, DVACC_n, RT_n, WCHIM_n, DOUBLE, EMCL_n, CC2_n, WCA_n, LSHADOW,
    output ECD_n, LAPA_n, EIPUR_n, EIPU_n, EIPL_n, EPTI_n, EPMAP_n, EPT_n
);

// Creating non-negated wires for active-low inputs
wire DVACC = ~DVACC_n;
wire RT = ~RT_n;
wire WCHIM = ~WCHIM_n;
wire DOUBLE_n = ~DOUBLE;
wire WCA = ~WCA_n;

wire CA0_n = ~CA0;
wire WRITE_n = ~WRITE;  
wire LSHADOW_n = ~LSHADOW;


// MEMORY MANAGEMENT CONTROL

// Logic for ECD_n (active-low)
assign ECD_n = ~((WCA & LSHADOW_n) |                // DISABLE CACHE ON SHADOW ACCESSES
                 (RT & LSHADOW_n & CC2_n));         // ENABLE WHEN WRITING IN CACHE

// Logic for LAPA_n (active-low)
assign LAPA_n = ~(DVACC & LSHADOW_n & WCHIM_n);     // LA TO PPN WHEN VIRTUAL ACCESSES ARE DISABLED

// Logic for EIPUR_n (active-low)
assign EIPUR_n = ~(DOUBLE_n & LSHADOW & WRITE);     // WRITING IN SHADOW IN REX MODE WILL MASK AWAY THE PROTECT BITS

// Logic for EIPU_n (active-low)
assign EIPU_n = ~((WCHIM) |                         // PASS PAGE NUMBER TO BE INHIBITED FROM IDB
                  (DOUBLE & LSHADOW & CA0) |        // SHADOW ACCESSES IN SEX MODE
                  (DOUBLE & LSHADOW & WRITE));      // WRITING IN SHADOW IN SEX MODE WILL WRITE A FULL BIT PAGE NUMBER

// Logic for EIPL_n (active-low)
assign EIPL_n = ~((WCHIM) |                         // PASS PAGE NUMBER TO BE INHIBITED FROM IDB
                  (DOUBLE & LSHADOW & CA0) |        // SHADOW ACCESSES IN SEX MODE
                  (DOUBLE & LSHADOW & WRITE));      // WRITING LOWER BYTE (SAME FOR REX AND SEX)

// Logic for EPTI_n (active-low)
assign EPTI_n = ~((LSHADOW & EMCL_n & WRITE)    |     // DISABLE DURING EMCL TO AVOID JAMMING THE IDB
                  (LSHADOW & EMCL_n & DOUBLE_n) |     // ENABLE ONLY WHEN IN SHADOW
                  (LSHADOW & EMCL_n & CA0_n));        // DISABLE WHEN IN SEX MODE WE ARE READ/FETCHING ADDRESSES

// Logic for EPMAP_n (active-low)
assign EPMAP_n = ~((WCHIM_n & DVACC_n & WRITE_n)  |   // DISABLE WHEN WRITING THE CACHE INHIBIT MAP
                   (WCHIM_n & DVACC_n & LSHADOW_n)|   // DISABLE WHEN VIRTUAL ACCESS IS DISABLED
                   (WCHIM_n & DVACC_n & DOUBLE_n) |   // ACCESSING SHADOW MEMORY
                   (WCHIM_n & DVACC_n & CA0)      |   // DISABLE ON SHADOW MEMORY WRITE IN SEX MODE
                   (WCHIM_n & LSHADOW & WRITE_n)  |   // ADDRESSES
                   (WCHIM_n & LSHADOW & DOUBLE_n) |
                   (WCHIM_n & LSHADOW & CA0));

// Logic for EPT_n (active-low)
assign EPT_n = ~((WRITE_n & EMCL_n)               |   // DISABLE ON EMCL OR 
                 (LSHADOW_n & EMCL_n)             |   // WRITING IN OTHER HALF
                 (DOUBLE_n & EMCL_n)              |   // WHEN IN SEX MODE
                 (CA0_n & EMCL_n));                

endmodule
