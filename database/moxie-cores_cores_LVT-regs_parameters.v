
`define WORD_WIDTH       32
`define WORD             [`WORD_WIDTH-1:0]

`define MEM_ADDR_WIDTH   4
`define MEM_ADDR         [`MEM_ADDR_WIDTH-1:0]

`define MEM_DEPTH        16
`define MEM              [`MEM_DEPTH-1:0]

// Table pointing to which bank holds live register value
`define LVT_ENTRY_WIDTH   1
`define LVT_ENTRY         [`LVT_ENTRY_WIDTH-1:0]
// One entry for each register
`define LVT_DEPTH         (1 << `MEM_ADDR_WIDTH)
`define LVT               [`LVT_DEPTH-1:0]


`define BANK_0 `LVT_ENTRY_WIDTH'd0
`define BANK_1 `LVT_ENTRY_WIDTH'd1

`define HIGH 1'b1
`define LOW  1'b0

// Used for various write enables
`define READ  `LOW
`define WRITE `HIGH

  
