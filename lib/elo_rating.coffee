class EloRating



	constructor: (ratingA, ratingB, scoreA, scoreB) ->

		# the K factor used
		@KFACTOR = 16		

		@_ratingA = ratingA
		@_ratingB = ratingB
		@_scoreA = scoreA
		@_scoreB = scoreB

		expectedScores = @_getExpectedScores @_ratingA,@_ratingB
		@_expectedA = expectedScores.a
		@_expectedB = expectedScores.b

		newRatings = @_getNewRatings @_ratingA, @_ratingB, @_expectedA, @_expectedB, @_scoreA, @_scoreB
		@_newRatingA = newRatings.a
		@_newRatingB = newRatings.b

	setNewSetings: (ratingA, ratingB, scoreA, scoreB) ->
		@_ratingA = ratingA
		@_ratingB = ratingB
		@_scoreA = scoreA
		@_scoreB = scoreB

		expectedScores = @_getExpectedScores @_ratingA, @_ratingB
		@_expectedA = expectedScores.a
		@_expectedB = expectedScores.b	

		newRatings = @_getNewRatings @_ratingA, @_ratingB, @_expectedA, @_expectedB, @_scoreA, @_scoreB
		@_newRatingA = newRatings.a
		@_newRatingB = newRatings.b


	getNewRatings: () ->
		ratings = {
			 a: Math.round @_newRatingA
			 b: Math.round @_newRatingB			
		}


	_getExpectedScores: (ratingA, ratingB) ->
		expectedScoreA = 1 / ( 1 + Math.pow 10, ( ratingB - ratingA ) / 400 ) 
		expectedScoreB = 1 / ( 1 + Math.pow 10, ( ratingA - ratingB ) / 400 )

		expected = {
			a: expectedScoreA
			b: expectedScoreB
		}


	_getNewRatings: (ratingA, ratingB, expectedA, expectedB, scoreA, scoreB) ->
		newRatingA = ratingA + ( @KFACTOR * ( scoreA - expectedA ) )
		newRatingB = ratingB + ( @KFACTOR * ( scoreB - expectedB ) )

		ratings = {
			a: newRatingA
			b: newRatingB			
		}


		 
# Starting Tests

# First Rating. Everybody starting with 1400
elo = new EloRating()

console.log 'Start'
console.log '---'
ratingA = 1400
ratingB = 1400

console.log 'Everybody starts with 1400 rating'
console.log 'A: ' + ratingA + ' - ' + 'B: ' + ratingB
console.log '---'


girlA = 1
girlB = 0


console.log 'Data inputed: A: ' + girlA + ' - B: '+ girlB
console.log '---'
console.log 'New Ratings:'
console.log '---'

elo.setNewSetings ratingA, ratingB, girlA, girlB

results = elo.getNewRatings()

console.log 'A: ' + results.a + ' - ' + 'B: ' + results.b
console.log '---'
console.log 'Now keep changing :)'



