const links = document.getElementsByClassName('link');
const rowElementsNumber = links.length / document.getElementsByClassName('subtitle').length;

const baseStyle = links[0].style;

var pos = 0;

function move(newPos) {
    if ((newPos >= 0) && (newPos < links.length) && 
    (newPos%rowElementsNumber != 0 || pos%rowElementsNumber != rowElementsNumber - 1) &&
    (newPos%rowElementsNumber != rowElementsNumber - 1 || pos%rowElementsNumber != 0)) {
        links[pos].setAttribute('style', baseStyle);
        pos = newPos;
        links[pos].setAttribute('style', 'color: var(--red);');
    }
}

window.addEventListener('keydown', (e) => {
    const keyName = e.key;

    if (document.activeElement.id === 'q') {
        if (keyName === 'Escape') {
            document.activeElement.blur();
            links[pos].setAttribute('style', 'color: var(--red);');
        }

    } else {
        switch (keyName) {
            case 'h':
                move(pos - rowElementsNumber);
                break;

            case 'j':
                move(pos + 1);
                break;

            case 'k':
                move(pos - 1);
                break;

            case 'l':
                move(pos + rowElementsNumber);
                break;

            case 'i':
                setTimeout(() => { document.getElementById("q").focus() }, 1);
                links[pos].setAttribute('style', baseStyle);
                break;

            case 'Enter':
                links[pos].click();
                break;
        }
    }
}, false);

window.addEventListener('click', e => {
    if (document.activeElement.id === 'q') {
        links[pos].setAttribute('style', baseStyle);
    }
}, false);