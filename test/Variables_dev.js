const { expect } = require('chai');
const { ethers } = require('hardhat');

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

const ether = tokens

describe('Variables', () => {
  it('it has a state variable with a default value', async () => {
    const Contract = await ethers.getContractFactory('Variables_dev1')
    let variables = await Contract.deploy()
    await variables.deployed() // This just ensures the contract is deployed
    // You should call a specific method to get the value you want to test
    // For example: expect(await variables.getValue()).to.equal('Example 1')
  })
})

describe('Example 2', () => {
  it('it has a state variable with a default value', async () => {
    const Contract = await ethers.getContractFactory('Variables_dev2')
    let contract = await Contract.deploy('String_Bilbo')
    expect(await contract.name()).to.equal('String_Bilbo') 
  })
})

describe('Example 3', () => {
  let contract 

  beforeEach(async () => {
    const Contract = await ethers.getContractFactory('Variables_dev3')
    contract = await Contract.deploy()
  })

  it('it has blank name by default', async () => {
    expect(await contract.getName()).to.equal('')
  })

  it('has a function to set name & set state variable', async () => {
    await contract.setName('Example 3')
    expect(await contract.getName()).to.equal('Example 3')
  })

  it('does not expose a "#name()" function', async () => {
    //await expect(contract.name).to.be.reverted;
  })
})

describe('Example 4', () => {
  let contract

  beforeEach(async ()=> {
    const Contract = await ethers.getContractFactory('Variables_dev4')
    contract = await Contract.deploy()
  })

  it('has a NAME constant', async () => {
    expect(await contract.name()).to.equal('Example_name_Larry')
  })

  it('tracks the owner as immutable', async () => {
    let accounts = await ethers.getSigners()
    expect(await contract.owner()).to.equal(accounts[0].address)
  })

})

describe('Example 5', () => {
  let contract

  beforeEach(async () => {
    const Contract = await ethers.getContractFactory('Variables_dev5')
    contract = await Contract.deploy()
  })

  it('demonstrates "this" global varable', async ()=> {
    expect(await contract.contractAddress()).to.equal(contract.address)
  })

  it('demonstrates "msg" and "tx" global variables', async ()=> {
    await contract.pay({ value: ether(1) })
    expect(await contract.getBalance()).to.equal(ether(1))
    let accounts = await ethers.getSigners()
    expect(await contract.payer()).to.equal(accounts[0].address)
    expect(await contract.origin()).to.equal(accounts[0].address)
  })

  it('demonstrates "block" global variable', async ()=> {
    let result = await contract.getBlockInfo()
    console.log(result)
  })
})

