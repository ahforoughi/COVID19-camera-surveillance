import streamlit as st
import cv2 as cv
st.write("""
#       Live Face Mask detection
""")
@st.cache(allow_output_mutation=True)
def get_cap():
    return cv.VideoCapture(0)

cap = get_cap()

frameST = st.empty()
param=st.sidebar.slider('chose your value')

while True:
    ret, frame = cap.read()
    # Stop the program if reached end of video
    if not ret:
        print("Done processing !!!")
        cv.waitKey(3000)
        # Release device
        cap.release()
        break

    frameST.image(frame, channels="BGR")