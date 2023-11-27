----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:53 11/27/2022 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Switch : in  STD_LOGIC_VECTOR (3 downto 0);
           Button : in  STD_LOGIC;
			  ButtonPW	: in STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (3 downto 0);
           Lock : out  STD_LOGIC);
end top;

architecture Behavioral of top is
type eg_state_type is (Locked, Unlocked, WrongPW, ChangePW, PW0, PW1, PW2, PW3, PW4, PW5, PW6, PW7, PW8, PW9, PW10, PW11, PW12, PW13, PW14, PW15);
signal state_reg, state_next: eg_state_type;
signal PW: std_logic_vector (3 downto 0);
 
begin
	process (clock, reset)
	begin
		if(reset='1') then
			state_reg <= Locked;
		elsif (clock'event and clock='1') then
			state_reg <= state_next;
		end if;
	end process;
	
--next state logic
	process (state_reg, Switch, Button, ButtonPW)
	begin

		case state_reg is
			when Locked =>
				if Switch=PW and Button='1' then
					state_next <= Unlocked;
				elsif Button='1' then
					state_next <= WrongPW;
				elsif ButtonPW='1' then
					state_next <= ChangePW;
				else
					state_next <= Locked;
				end if;
				
			when Unlocked =>
				if Button='1' then
					state_next <= Locked;
				else
					state_next <= Unlocked;
				end if;
				
			When WrongPW =>
				state_next <= Locked;
				
			when ChangePW =>
				if ButtonPW='1' then
					state_next <= Locked;
				elsif Switch="0001" and Button='1' then
					state_next <= PW1;
				elsif Switch="0000" and Button='1' then
					state_next <= PW0;
				elsif Switch="0010" and Button='1' then
					state_next <= PW2;
				elsif Switch="0011" and Button='1' then
					state_next <= PW3;
				elsif Switch="0100" and Button='1' then
					state_next <= PW4;
				elsif Switch="0101" and Button='1' then
					state_next <= PW5;
				elsif Switch="0110" and Button='1' then
					state_next <= PW6;
				elsif Switch="0111" and Button='1' then
					state_next <= PW7;
				elsif Switch="1000" and Button='1' then
					state_next <= PW8;
				elsif Switch="1001" and Button='1' then
					state_next <= PW9;
				elsif Switch="1010" and Button='1' then
					state_next <= PW10;
				elsif Switch="1011" and Button='1' then
					state_next <= PW11;
				elsif Switch="1100" and Button='1' then
					state_next <= PW12;
				elsif Switch="1101" and Button='1' then
					state_next <= PW13;
				elsif Switch="1110" and Button='1' then
					state_next <= PW14;
				elsif Switch="1111" and Button='1' then
					state_next <= PW15;
				else
					state_next <= ChangePW;
				end if;
				
			when PW0=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW0;
				end if;
			
			when PW1=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW1;
				end if;
			
			when PW2=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW2;
				end if;
			
			when PW3=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW3;
				end if;
			
			when PW4=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW4;
				end if;
			
			when PW5=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW5;
				end if;
			
			when PW6=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW6;
				end if;
			
			when PW7=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW7;
				end if;
			
			when PW8=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW8;
				end if;
			
			when PW9=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW9;
				end if;
			
			when PW10=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW10;
				end if;
			
			when PW11=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW11;
				end if;
			
			when PW12=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW12;
				end if;
			
			when PW13=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW13;
				end if;
			
			when PW14=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW14;
				end if;
			
			when PW15=>
				if Button='1' then
					state_next <= ChangePW;
				else
					state_next <= PW15;
				end if;
				
				
				

			end case;
		end process;
		
--moore output logic
	process (state_reg)
		begin
			case state_reg is
				when Locked =>
					LED <= "0001";
					Lock <= '0';
					
				when Unlocked =>
					LED <= "1001";
					Lock <= '1';
					
				when WrongPW =>
					LED <= "1111";
					Lock <= '0';
					
				when ChangePW =>
					LED <= "0110";
					Lock <= '0';	
					
				when PW0 =>
					PW <= "0000";
					LED <= "1000";
					Lock <= '0';

				when PW1 =>
					PW <= "0001";
					LED <= "1000";
					Lock <= '0';

				when PW2 =>
					PW <= "0010";
					LED <= "1000";
					Lock <= '0';

				when PW3 =>
					PW <= "0011";
					LED <= "1000";
					Lock <= '0';

				when PW4 =>
					PW <= "0100";
					LED <= "1000";
					Lock <= '0';

				when PW5 =>
					PW <= "0101";
					LED <= "1000";
					Lock <= '0';

				when PW6 =>
					PW <= "0110";
					LED <= "1000";
					Lock <= '0';

				when PW7 =>
					PW <= "0111";
					LED <= "1000";
					Lock <= '0';

				when PW8 =>
					PW <= "1000";
					LED <= "1000";
					Lock <= '0';

				when PW9 =>
					PW <= "1001";
					LED <= "1000";
					Lock <= '0';

				when PW10 =>
					PW <= "1010";
					LED <= "1000";
					Lock <= '0';

				when PW11 =>
					PW <= "1011";
					LED <= "1000";
					Lock <= '0';

				when PW12 =>
					PW <= "1100";
					LED <= "1000";
					Lock <= '0';

				when PW13 =>
					PW <= "1101";
					LED <= "1000";
					Lock <= '0';

				when PW14 =>
					PW <= "1110";
					LED <= "1000";
					Lock <= '0';

				when PW15 =>
					PW <= "1111";
					LED <= "1000";
					Lock <= '0';
					
				
			end case;
		end process;
	


end Behavioral;

