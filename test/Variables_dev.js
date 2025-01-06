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
