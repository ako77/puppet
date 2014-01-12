node 'cmmaster', 'lnx-01' {
  include puppet
  include accounts
  realize (Accounts::Virtual['ead'])
}
