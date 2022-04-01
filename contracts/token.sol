// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract FirstToken 
{
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    //TODO: STEP1
    //Implement three public fields
        // name, which is of type string
        // symbol, which is of type string 
        // decimals which is of type uint8




    /**
     * @dev Returns the name of the token.
     */
    string public name = "ONESOURCE TOKEN";
    

    /**
     * @dev Returns the symbol of the token.
     */
    string public symbol = "ONESRC";
    

    /**
     * @dev Returns the decimals places of the token.
     */
    uint8 public decimals  = 0;
   

    //TODO: STEP 2
        //Implement one public field called totalSupply of type uint, but don't initialize the value yet.
    uint public totalSupply;
    
    //TODO: STEP 3
        //Create a mapping that represents the balance of the user
        // the key of the mapping would be an address type representing the user's wallet
        // the value of the mapping would be the token balance of the user
    mapping (address => uint) public balances; 

    
    //TODO STEP 4
        //Create a constructor for the contract which does the following
            //sets the token balance of the deployer account to one million
            //sets the totalSupply field to one million
    constructor(){
        totalSupply = 1000000;
        balances[msg.sender] = 1000000;
    }


    //TODO STEP 5
        // Implement balanceOf method below
        // Returns the amount of tokens owned by `account`.
    function balanceOf(address account) external view returns (uint256){
        //**Hint: need to use the balance mapping  created in STEP 3
        return balances[account];
    }

    //TODO STEP 6
        // implement transfer method below
        // Fails if calling address has less tokens than the amount to transfer
        // Moves `amount` tokens from the caller's account to `to`
        // Emits a Transfer event
        // Returns whether the transfer is successful 

    function transfer(address to, uint256 amount) external returns (bool){
        /**Hint
            Check if the calling address (msg.sender) has greater than or equal to amount of tokens*/
        require (balances[msg.sender] > amount, "not enough tokens");

        /**Hint
            use the balance mapping in STEP 3 to: 
                - reduce the balance of the calling address (sender of tokens)
                - increase the balance of the to address (receiver of tokens)
             */
        balances[msg.sender] = balances[msg.sender] - amount;
        balances[to] = balances[to] + amount;

        /**Hint
            emit the Transfer event */
        emit Transfer(msg.sender, to, amount );

        /**Hint
            can get away with just returning true, since there are no other conditions for transaction failure
             */
        return true;
    }



   
   /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);


    //TODO STEP 7 (optional)
        //Create a mapping (allowances) that represents how much a user has approved other users to spend for them
            //The key of the mapping would be an address representing the user's wallet
            // the value is another mapping with a key of type address and value of type uint
        /**Hint:  copy the mapping from step 3, paste it here then replace uint with mapping (address => uint)*/
    mapping (address => mapping (address => uint )) public allowances;
        
    //TODO STEP 8 (optional)
        // implement allowance method below
        // Returns the remaining number of tokens that `spender` will be allowed to spend on behalf of `owner` 

    function allowance(address owner, address spender) external view returns (uint256){
        //**Hint: need to use the balance mapping  created in STEP 7
        return allowances[owner][spender];
    }

    //TODO STEP 9 (optional)
        // implement approve method below
        // Sets `amount` as the allowance of `spender` over the caller's tokens.
        // Returns a boolean value indicating whether the operation succeeded.
        // Emits an {Approval} event

    function approve(address spender, uint256 amount) external returns (bool){
        /**Hint
            set the right value on the mapping created in STEP 7 */
        allowances[msg.sender][spender] = amount;

        /**Hint
            emit the Approval event */
        emit Approval(msg.sender, spender, amount);

        /**Hint
            can get away with just returning true, since there are no other conditions for transaction failure
             */
        return true;
    }

    //TODO STEP 10 (optional)
        //Implement transferFrom method below
        // Fails if from address has less tokens than the amount to transfer
        // Fails if the 
        //Moves `amount` tokens from `from` to `to` using the allowance mechanism.
        //Emits a {Transfer} event.
        //Returns a boolean
   
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool){
        

         /**Hint
            Check if the from address has greater than or equal to amount of tokens*/
        require (balances[from] >= amount, "not enough tokens");

        /**Hint
            Check if msg.sender is approved to spend the specified amount of tokens of the from address*/
        require (allowances[from][msg.sender] >= amount, "not enough allowance");

        /**Hint
            Reduce the allowance value for from address using the mapping created in Step 7*/
        allowances[from][msg.sender] -= amount;

        /**Hint
            use the balance mapping in STEP 3 to: 
                - reduce the balance of the calling address (sender of tokens)
                - increase the balance of the to address (receiver of tokens)
             */
        balances[from] -= amount;
        balances[to] += amount;

        /**Hint
            emit the Transfer event */
        emit Transfer(from, to, amount);

        /**Hint
            can get away with just returning true, since there are no other conditions for transaction failure
             */
        return true;
    }
}
