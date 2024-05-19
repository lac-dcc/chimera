// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`ifndef __LA_DEFINES__
`define __LA_DEFINES__

`define TRIG                  32'h00000000

`define LA_DEFAULT_BAUDRATE   115200

//UART Interface
`define HEX_0                 8'h30
//W = Write (start)
`define START_ID              8'h57
//R = Read (Response)
`define RESPONSE_ID           8'h52

`define RESPONSE_SUCCESS      8'h53
`define RESPONSE_FAIL         8'h5A
`define RESPONSE_ENABLE       8'h65
`define RESPONSE_DISABLE      8'h66
`define CARRIAGE_RETURN       8'h0D
`define LINE_FEED             8'h0A

`define LA_PING               (0 + `HEX_0)
//ID:                   'W'
//Command:              '0'
//CR:                   '\n'

//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'


`define LA_SET_ENABLE         (1 + `HEX_0)
//set enable structure
//ID:                   'W'
//Command:              '2'
//Enabled:              '0' = Disable, '1' = Enable
//CR:                   '\n'

//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'


`define LA_GET_ENABLE         (2 + `HEX_0)
//get enable structure
//ID:                   'W'
//Command:              '3'
//CR:                   '\n'

//Response ID:          'R'
//Response Status:      '0' = Disabled '1' = Enabled
//LF:                   '\r'
//CR:                   '\n'

`define LA_GET_SIZE           (3 + `HEX_0)
//get the size of a read * 4 * bytes
//ID:                   'W'
//Command:              '4'
//CR:                   '\n'

//Response ID:          'R'
//Response Status       'V' 'V' 'V' 'V' 'V' 'V' 'V' 'V'
//LF:                   '\r'
//CR:                   '\n'

`define LA_WRITE_TRIGGER      (4 + `HEX_0)
//write trigger
//ID:                   'W'
//Command:              '4'
//Trigger:              'V' 'V' 'V' 'V' 'V' 'V' 'V' 'V'
//CR:                   '\n'


//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'

`define LA_WRITE_MASK        (5 + `HEX_0)
//write trigger mask
//ID:                   'W'
//Command:              '5'
//Trigger Mask:         'V' 'V' 'V' 'V' 'V' 'V' 'V' 'V'
//CR:                   '\n'

//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'

`define LA_WRITE_TRIGGER_AFTER        (6 + `HEX_0)
//write trigger after
//ID:                   'W'
//Command:              '6'
//Trigger After:        'V' 'V' 'V' 'V' 'V' 'V' 'V' 'V'
//CR:                   '\n'


//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'

`define LA_WRITE_TRIGGER_EDGE        (7 + `HEX_0)
//write trigger edge
//ID:                   'W'
//Command:              '7'
//Trigger Edge:         'V' 'V' 'V' 'V' 'V' 'V' 'V' 'V'


//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'

`define LA_WRITE_BOTH_EDGES        (8 + `HEX_0)
//write both edges
//ID:                   'W'
//Command:              '8'
//Both Edges:           'V' 'V' 'V' 'V' 'V' 'V' 'V' 'V'
//CR:                   '\n'

//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'


`define LA_WRITE_REPEAT_COUNT        (9 + `HEX_0)
//write repeat count
//ID:                   'W'
//Command:              '9'
//Repeat Count:         'V' 'V' 'V' 'V' 'V' 'V' 'V' 'V'
//CR:                   '\n'

//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'

`define LA_GET_START_POS            (10 + `HEX_0)
//get the start position
//ID:                   'W'
//Command               ':'
//CR:                   '\n'

//Response ID:          'R'
//Response Start pos    'V' 'V' 'V' 'V' 'V' 'V' 'V' 'V'
//LF:                   '\r'
//CR:                   '\n'

`define LA_RESET                    (11 + `HEX_0)
//reset all the state machine
//ID:                   'w'
//Command               ';'
//CR:                   '\n'

//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'

`define LA_FORCE_TRIGGER            (12 + `HEX_0)
//reset all the state machine
//ID:                   'w'
//Command               '<'
//CR:                   '\n'

//Response ID:          'R'
//Response Status:      'S' = Success, 'X' = Fail
//LF:                   '\r'
//CR:                   '\n'



`endif


