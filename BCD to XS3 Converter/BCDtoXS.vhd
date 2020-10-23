----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:49 05/20/2020 
-- Design Name: 
-- Module Name:    BCDtoXS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCDtoXS is
    Port ( B : in  STD_LOGIC_VECTOR (3 downto 0);
           X : out  STD_LOGIC_VECTOR (3 downto 0));
end BCDtoXS;

architecture Behavioral of BCDtoXS is

begin
process(B)
begin
if(B > "1001") then 
X <= "0000";
else
x <= B + "0011";
end if;
end process;
end Behavioral;

