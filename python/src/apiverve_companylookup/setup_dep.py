from setuptools import setup, find_packages

setup(
    name='apiverve_companylookup',
    version='1.2.3',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Company Lookup matches stock tickers, CIK numbers, company names, or SIC codes with official SEC registration records. It returns legal entity names, trading exchanges, tax EINs, Standard Industrial Classification codes, and registered business addresses.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/companylookup?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
