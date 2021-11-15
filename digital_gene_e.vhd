LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;

ENTITY digital_gene IS
    generic( bit_size : integer := 4);
    PORT(
        reset      : OUT std_logic;
        enable     : OUT std_logic;
	      factor     : OUT unsigned(bit_size-1 downto 0); -- facteur de division
        clk,clk2   : OUT std_logic
    );
END digital_gene;
