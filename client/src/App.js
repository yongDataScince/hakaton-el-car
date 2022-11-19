import { motion, useAnimation } from "framer-motion";
import { useInView } from "react-intersection-observer";
import { useEffect } from "react";
import card from './car.png'

const boxVariantLeft = {
  visible: { opacity: 1, x: 0, transition: { duration: 0.5 } },
  hidden: { opacity: 0, x: -100 },
}

const boxVariantRight = {
  visible: { opacity: 1, x: -50, transition: { duration: 0.5, delay: 0.5  } },
  hidden: { opacity: 0, x: 100 },
}

const textVariants = [
  {
    id: 1,
    text: "Простота",
    variant: {
      visible: { opacity: 1, x: 0, transition: { duration: 0.5, delay: 0.9  } },
      hidden: { opacity: 0, x: -50 },
    }
  },
  {
    id: 2,
    text: "Удобство",
    variant: {
      visible: { opacity: 1, x: 0, transition: { duration: 0.5, delay: 1.3  } },
      hidden: { opacity: 0, x: -50 },
    }
  },
  {
    id: 3,
    text: "Безопасность",
    variant: {
      visible: { opacity: 1, x: 0, transition: { duration: 0.5, delay: 1.7  } },
      hidden: { opacity: 0, x: -50 },
    }
  }
];

function App() {
  const leftControl = useAnimation()
  const rightControl = useAnimation()

  const [reTitle, titleInView] = useInView()
  const [refImg, imgInView] = useInView()

  const [text1, text1View] = useInView()
  const [text2, text2View] = useInView()
  const [text3, text3View] = useInView()

  const textRefs = [text1, text2, text3];

  useEffect(() => {
    if (titleInView) {
      leftControl.start("visible");
    }

    if (imgInView) {
      rightControl.start("visible");
    }

    if (text1View || text2View || text3View) {
      leftControl.start("visible");
    }
  }, [titleInView, leftControl, imgInView, rightControl, text1View, text2View, text3View]);

  return (
    <div className="App">
      <motion.div
        ref={reTitle}
        variants={boxVariantLeft}
        initial="hidden"
        animate={leftControl}
      >
        <p className="title">Electro Car-D</p>
      </motion.div>

      <motion.div
        className="card-container"
        ref={refImg}
        variants={boxVariantRight}
        initial="hidden"
        animate={rightControl}
      >
        <div className="text-block">
          {
            textVariants.map((t) => (
              <motion.div ref={textRefs[t.id - 1]} variants={t.variant} initial="hidden" animate={leftControl} key={t.id}>
                <p className="text">- {t.text}</p>
              </motion.div>
            ))
          }
        </div>
        <img src={card} alt="" className="card-img" />
      </motion.div>
    </div>
  );
}

export default App;
