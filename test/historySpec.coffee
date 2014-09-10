history = require('../src/history.coffee')

nop = (x)-> x

describe 'history', ->
  it 'success', (done)->
    http = (q)->
      expect(q.method).toBe('GET')
      expect(q.url).toBe('BASE/Alert/test-id/_history')
      q.success('ok')

    history
      baseUrl: 'BASE'
      http: http
      type: 'Alert'
      id: 'test-id'
      success: (data) ->
        expect(data).toBe('ok')
        done()
      error: nop

  it 'error', (done)->
    http = (q)-> q.error('ok')

    history
      baseUrl: 'BASE'
      http: http
      type: 'Alert'
      id: 'test-id'
      success: nop
      error: (data)->
        expect(data).toBe('ok')
        done()


describe 'historyType', ->
  it 'success', (done)->
    http = (q)->
      expect(q.method).toBe('GET')
      expect(q.url).toBe('BASE/Alert/_history')
      q.success('ok')

    history
      baseUrl: 'BASE'
      http: http,
      type:'Alert'
      success: (data) ->
        expect(data).toBe('ok')
        done()
      error: nop

  it 'error', (done)->
    http = (q)-> q.error('ok')

    history
      baseUrl:'BASE',
      http: http,
      type: 'Alert'
      success: nop
      error: (data)->
        expect(data).toBe('ok')
        done()

describe 'historyAll', ->
  it 'success', (done)->
    http = (q)->
      expect(q.method).toBe('GET')
      expect(q.url).toBe('BASE/_history')
      q.success('ok')

    history
      baseUrl: 'BASE'
      http: http
      success: (data) ->
        expect(data).toBe('ok')
        done()
      error: nop

  it 'error', (done)->
    http = (q)-> q.error('ok')

    history
      baseUrl: 'BASE'
      http: http
      success: nop
      error: (data)->
        expect(data).toBe('ok')
        done()
