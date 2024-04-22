---------------------------------------
-- SHA-256 helper package
-- Rev 0.1
-- Peter Fousteris
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package sha256_functions is
    type wordArray is array( 0 to 63 ) of std_logic_vector( 31 downto 0 );
    type hashArray is array( 0 to 7 ) of std_logic_vector( 31 downto 0 );
    type BlockM is array ( integer range <> ) of std_logic_vector ( 511 downto 0 );
    type fsmStates is (IDLE, HASH);
    
    constant constHashes : hashArray  := ( X"6a09e667", X"bb67ae85", X"3c6ef372", X"a54ff53a", X"510e527f", X"9b05688c", X"1f83d9ab", X"5be0cd19");
    constant constK : wordArray := ( X"428a2f98", X"71374491", X"b5c0fbcf", X"e9b5dba5", X"3956c25b", X"59f111f1", X"923f82a4", X"ab1c5ed5",
                                   X"d807aa98", X"12835b01", X"243185be", X"550c7dc3", X"72be5d74", X"80deb1fe", X"9bdc06a7", X"c19bf174",
                                   X"e49b69c1", X"efbe4786", X"0fc19dc6", X"240ca1cc", X"2de92c6f", X"4a7484aa", X"5cb0a9dc", X"76f988da",
                                   X"983e5152", X"a831c66d", X"b00327c8", X"bf597fc7", X"c6e00bf3", X"d5a79147", X"06ca6351", X"14292967",
                                   X"27b70a85", X"2e1b2138", X"4d2c6dfc", X"53380d13", X"650a7354", X"766a0abb", X"81c2c92e", X"92722c85",
                                   X"a2bfe8a1", X"a81a664b", X"c24b8b70", X"c76c51a3", X"d192e819", X"d6990624", X"f40e3585", X"106aa070",
                                   X"19a4c116", X"1e376c08", X"2748774c", X"34b0bcb5", X"391c0cb3", X"4ed8aa4a", X"5b9cca4f", X"682e6ff3",
                                   X"748f82ee", X"78a5636f", X"84c87814", X"8cc70208", X"90befffa", X"a4506ceb", X"bef9a3f7", X"c67178f2" );
    -- Functions Declaration
    function ch ( x, y, z : std_logic_vector( 31 downto 0 ) ) return std_logic_vector;
    function Maj ( x, y, z : std_logic_vector( 31 downto 0 ) ) return std_logic_vector;
    function capSigma0 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector;
    function capSigma1 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector;
    function sigma0 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector;
    function sigma1 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector;
    function kCalculator ( l : integer ) return integer;
    function messagePadding ( message : std_logic_vector; l : integer ) return BlockM;
    function setDigest ( H : std_logic_vector( 255 downto 0 ) ) return std_logic_vector;
    
    -- Procedures Declaration
    procedure initializeH ( signal H : inout std_logic_vector( 255 downto 0 ); constant constHashes : in hashArray );  
    procedure initializeWork ( signal a, b, c, d, e, f, g, h_reg : inout std_logic_vector( 31 downto 0 ); signal H : in std_logic_vector( 255 downto 0 ) );
    procedure updateHashes ( signal H : inout std_logic_vector( 255 downto 0 ); signal a, b, c, d, e, f, g, h_reg : in std_logic_vector( 31 downto 0 ) );

end sha256_functions;

package body sha256_functions is

    -- Main SHA-256 functions, as defined in §4.1.2.
    -- Each function operates on 32-bit words.
    -- The result of each function is a new 32-bit word.

    -- Calculates the result of ch(x,y,z) function.
    function ch ( x, y, z: std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( ( x and y ) xor ( not( x ) and z ) );
    end function;

    -- Calculates the result of Maj(x,y,z) function.
    function maj ( x, y, z: std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( ( x and y ) xor ( x and z ) xor ( y and z ) );
    end function;

    -- Calculates the result of ?0(x) function.
    function capSigma0 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( rotate_right( unsigned ( x ), 2 ) xor rotate_right( unsigned ( x ), 13 ) xor rotate_right( unsigned ( x ), 22 ) );
    end function;

    -- Calculates the result of ?1(x) function.
    function capSigma1 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( rotate_right( unsigned ( x ), 6 ) xor rotate_right( unsigned ( x ), 11 ) xor rotate_right( unsigned ( x ), 25 ) );
    end function;

    -- Calculates the result of ?0(x) function.
    function sigma0 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( rotate_right( unsigned ( x ), 7 ) xor rotate_right( unsigned ( x ), 18 ) xor shift_right( unsigned ( x ), 3 ) );
    end function;

    -- Calculates the result of ?0(x) function.
    function sigma1 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( rotate_right( unsigned ( x ), 17 ) xor rotate_right( unsigned ( x ), 19 ) xor shift_right( unsigned ( x ), 10 ) );
    end function;

    -- Helper SHA-256 functions

    -- Calculates the number of zeros that must be added to the padded message defined in §5.1.1. 
    function kCalculator ( l : integer ) return integer is
    begin
        return ( 447 - l ) mod 512;
    end function;

    -- Padds the input message as defined in ?5.1.1.
    function messagePadding ( message : std_logic_vector; l : integer ) return BlockM is
        variable paddedMessage : std_logic_vector( ( l + kCalculator( l ) + 1 + 64 ) - 1 downto 0 ) := (others => '0');
        variable k ,paddedLength , N : integer := 0;
        variable M : BlockM ( ( kCalculator( l ) + l + 1 + 64 )/ 512 - 1 downto 0 ) := ( (others => ( others => '0' ) ) );
        variable i : integer := 0;
        begin
            k := kCalculator( l ); -- Total number of zeros in padded message.
            paddedLength := l + k + 1 + 64; -- Total size of padded message.  
            -- Consruct padded message.
            paddedMessage ( ( paddedLength - 1 ) downto ( paddedLength - l ) ) := message( ( l - 1 ) downto 0 );
            paddedMessage ( paddedLength - l - 1 ) := '1';
            paddedMessage ( 63 downto 0 ) := std_logic_vector( to_unsigned( l, 64 ) );
            -- Count total (512-bit) blocks in the padded message.
            N := ( kCalculator( l ) + l + 1 + 64 )/512;
            while (i < N) loop
                M( i ) := paddedMessage( ( 512*( N-i ) -1 ) downto ( 512*( N - ( i+1 ) ) ) );
                i := i + 1;
            end loop;
        return M;
    end function;

    -- Loads the initial hash values as defined in ?5.3.3. 
    function setDigest ( H : std_logic_vector( 255 downto 0 ) ) return std_logic_vector is
    variable digest : std_logic_vector( 255 downto 0 ); 
    begin
        digest( 31 downto 0 ) := H( 255 downto 224 );
        digest( 63 downto 32 ) := H( 223 downto 192 );
        digest( 95 downto 64 ) := H( 191 downto 160 );
        digest( 127 downto 96 ) := H( 159 downto 128 );
        digest( 159 downto 128 ) := H( 127 downto 96 );
        digest( 191 downto 160 ) := H( 95 downto 64 );
        digest( 223 downto 192 ) := H( 63 downto 32 );
        digest( 255 downto 224 ) := H( 31 downto 0 );
        return digest;
    end function;

    -- Loads the initial hash values as defined in ?5.3.3. 
    procedure initializeH ( signal H : inout std_logic_vector( 255 downto 0 ); constant constHashes : in hashArray ) is
    begin
        H( 31 downto 0 ) <= constHashes( 0 );
        H( 63 downto 32 ) <= constHashes( 1 );
        H( 95 downto 64 ) <= constHashes( 2 );
        H( 127 downto 96 ) <= constHashes( 3 );
        H( 159 downto 128 ) <= constHashes( 4 ); 
        H( 191 downto 160 ) <= constHashes( 5 );
        H( 223 downto 192 ) <= constHashes( 6 );
        H( 255 downto 224 ) <= constHashes( 7 );
    end procedure;

    -- Loads the initial hash values as defined in ?5.3.3. 
    procedure initializeWork ( signal a, b, c, d, e, f, g, h_reg : inout std_logic_vector( 31 downto 0 ); signal H : in std_logic_vector( 255 downto 0 ) ) is
    begin
        a <= H( 31 downto 0 );
        b <= H( 63 downto 32 );
        c <= H( 95 downto 64 );
        d <= H( 127 downto 96 );
        e <= H( 159 downto 128 ); 
        f <= H( 191 downto 160 );
        g <= H( 223 downto 192 );
        h_reg <= H( 255 downto 224 );
    end procedure;

    -- Loads the initial hash values as defined in ?5.3.3. 
    procedure updateHashes ( signal H : inout std_logic_vector( 255 downto 0 ); signal a, b, c, d, e, f, g, h_reg : in std_logic_vector( 31 downto 0 ) ) is
    begin
        H( 31 downto 0 ) <= std_logic_vector( unsigned ( H( 31 downto 0 ) ) + unsigned( a ) );
        H( 63 downto 32 ) <= std_logic_vector( unsigned (  H( 63 downto 32 ) ) + unsigned( b ) );
        H( 95 downto 64 ) <= std_logic_vector( unsigned ( H( 95 downto 64 ) ) + unsigned( c ) );
        H( 127 downto 96 ) <= std_logic_vector( unsigned ( H( 127 downto 96 ) ) + unsigned( d ) ); 
        H( 159 downto 128 ) <= std_logic_vector( unsigned( H( 159 downto 128 ) ) + unsigned( e ) );
        H( 191 downto 160 ) <= std_logic_vector( unsigned( H( 191 downto 160 ) ) + unsigned( f ) );
        H( 223 downto 192 ) <= std_logic_vector( unsigned( H( 223 downto 192 ) ) + unsigned( g ) );
        H( 255 downto 224 ) <= std_logic_vector( unsigned( H( 255 downto 224 ) ) + unsigned( h_reg ) );
    end procedure;
end package body;