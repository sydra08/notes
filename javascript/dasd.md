/**
 * Don't change these constants!
 */
const DODGER = document.getElementById('dodger')
const GAME = document.getElementById('game')
const GAME_HEIGHT = 400
const GAME_WIDTH = 400
const LEFT_ARROW = 37 // use e.which!
const RIGHT_ARROW = 39 // use e.which!
const ROCKS = []
const START = document.getElementById('start')

var gameInterval = null

/**
 * Be aware of what's above this line,
 * but all of your work should happen below.
 */

function checkCollision(rock) {
  // implement me!
  // use the comments below to guide you!
  const top = positionToInteger(rock.style.top)

  // rocks are 20px high
  // DODGER is 20px high (position is 180px)
  // GAME_HEIGHT - 20 - 20 = 360px;
  if (top > 360) {
    const dodgerLeftEdge = positionToInteger(DODGER.style.left)

    // FIXME: The DODGER is 40 pixels wide -- how do we get the right edge?
    const dodgerRightEdge = positionToInteger(DODGER.style.right);

    const rockLeftEdge = positionToInteger(rock.style.left)

    // FIXME: The rock is 20 pixel's wide -- how do we get the right edge?
    const rockRightEdge = positionToInteger(rock.style.right);

    if ((rockLeftEdge < dodgerLeftEdge && rockRightEdge > dodgerLeftEdge) ||
    (rockLeftEdge > dodgerLeftEdge && rockRightEdge < dodgerRightEdge) ||
    (rockLeftEdge < dodgerRightEdge && rockRightEdge > dodgerRightEdge)
       /**
               * Think about it -- what's happening here?
               * There's been a collision if one of three things is true:
               * 1. The rock's left edge is < the DODGER's left edge,
               *    and the rock's right edge is > the DODGER's left edge;
               * 2. The rock's left edge is > the DODGER's left edge,
               *    and the rock's right edge is < the DODGER's right edge;
               * 3. The rock's left edge is < the DODGER's right edge,
               *    and the rock's right edge is > the DODGER's right edge
               */) {
      return true
    }
  }
}

function createRock(x) {
  const rock = document.createElement('div')

  rock.className = 'rock'
  rock.style.left = `${x}px`

  // Hmmm, why would we have used `var` here? bc top can be changed/re-assigned
  var top = 0

  rock.style.top = top

  $('.rock').append($('game'))
  /**
   * Now that we have a rock, we'll need to append
   * it to GAME and move it downwards.
   */
   function step() {
     rock.style.top = `${top - 2}px`
   }

  /**
   * This function moves the rock. (2 pixels at a time
   * seems like a good pace.)
   */
  function moveRock() {
    // implement me!
    // (use the comments below to guide you!)

    /**
     * If a rock collides with the DODGER,
     * we should call endGame()
     */
    if(checkCollision(rock)){
      endGame()
    }

    else if(rock.style.bottom > 0) {
        window.requestAnimationFrame(step)
    }

    /**
     * Otherwise, if the rock hasn't reached the bottom of
     * the GAME, we want to move it again.
     */
    else if(rock.style.bottom == 0) {
      rock.remove();
    }
    /**
     * But if the rock *has* reached the bottom of the GAME,
     * we should remove the rock from the DOM
     */
  }

  window.requestAnimationFrame(step)
  // We should kick of the animation of the rock around here

  // Add the rock to ROCKS so that we can remove all rocks
  // when there's a collision
  ROCKS.push(rock)

  // Finally, return the rock element you've created
  return rock
}

/**
 * End the game by clearing `gameInterval`,
 * removing all ROCKS from the DOM,
 * and removing the `moveDodger` event listener.
 * Finally, alert "YOU LOSE!" to the player.
 */
function endGame() {

  clearInterval(gameInterval); //assignment to constant variable
  for(var x = 0; x < ROCKS.length; x++) {
    ROCKS.shift();
  };
  window.removeEventListener('keydown', movedodger);//remove 'movedodger' keydown event listener
  alert('YOU LOSE!'); //all good here
}

function moveDodger(e) {
  // implement me!
  if(e.which === LEFT_ARROW) moveDodgerLeft();
  else if(e.which === RIGHT_ARROW) moveDodgerRight();
  /**
   * This function should call `moveDodgerLeft()` e.which === 37
   * if the left arrow is pressed and `moveDodgerRight()` e.which === 39
   * if the right arrow is pressed. (Check the constants
   * we've declared for you above.)
   * And be sure to use the functions declared below!
   USE A SWITCH HERE?
   */
}

function moveDodgerLeft() {
  // implement me!
    if(dodgerLeftEdge > 0) {
    DODGER.style.left = `${dodgerLeftEdge - 4}px`
    window.requestAnimationFrame(moveDodgerLeft);
  }
  /**
   * This function should move DODGER to the left
   * (mabye 4 pixels?). Use window.requestAnimationFrame()!
   */
}

function moveDodgerRight() {
  // implement me!
  if(dodgerRightEdge > 0) {
    DODGER.style.right = `${dodgerRightEdge - 4}px`;
    window.requestAnimationFrame(moveDodgerRight);
  }
  /**
   * This function should move DODGER to the right
   * (mabye 4 pixels?). Use window.requestAnimationFrame()!
   */
   window.requestAnimationFrame(moveDodgerRight);
}

/**
 * @param {string} p The position property
 * @returns {number} The position as an integer (without 'px')
 */
function positionToInteger(p) {
  return parseInt(p.split('px')[0]) || 0
}

function start() {
  window.addEventListener('keydown', moveDodger)

  START.style.display = 'none'

  gameInterval = setInterval(function() {
    createRock(Math.floor(Math.random() *  (GAME_WIDTH - 20)))
  }, 1000)
  //creates a rock
}
